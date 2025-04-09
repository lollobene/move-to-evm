#[evm_contract]
module Evm::basic_nft {
    use Evm::Evm::{sender, sign, require, /*address_of,*/ protection_layer_signer_address};
    use Evm::U256::{U256, zero, u256_from_u128, le};
    use Evm::Table::{Self, Table};

    const ENO_MINT_CAPABILITY: u64 = 0x1;
    const ETOKEN_CANNOT_HAVE_ZERO_AMOUNT: u64 = 0x2;
    const ETOKEN_STORE_NOT_PUBLISHED: u64 = 0x3;
    const EINVALID_TOKEN_MERGE: u64 = 0x4;
    const EMINT_CAPABILITY_NOT_PUBLISHED: u64 = 0x5;
    const ENFT_NAME_TOO_LONG: u64 = 0x6;
    const EURI_TOO_LONG: u64 = 0x7;
    const EWITHDRAW_ZERO: u64 = 0x8;
    const EINSUFFICIENT_BALANCE: u64 = 0x9;
    const ENO_TOKEN_IN_TOKEN_STORE: u64 = 0xA;
    const MAX_NFT_NAME_LENGTH: u64 = 32;
    const MAX_URI_LENGTH: u64 = 256;

    struct Token has store {
        id: TokenId,
        amount: u64,
    }

    struct TokenId has store, copy, drop {
        token_data_id: TokenDataId,
    }

    struct TokenDataId has copy, drop, store {
        creator: address,
        name: vector<u8>,
    }

    struct TokenData has key {
        maximum: u64,
        supply: u64,
        uri: vector<u8>,
        name: vector<u8>,
        description: vector<u8>
    }

    /// Represents token resources owned by token owner
    struct TokenStore has key {
        tokens: Table<TokenId, Token>
    }

    struct MintCapability has key {}

    /// capability to withdraw without signer, this struct should be non-copyable
    struct WithdrawCapability has drop, store {
        token_owner: address,
        token_id: TokenId,
        amount: u64,
        expiration_sec: u64,
    }


    /// create token with raw inputs
    public fun create_token_script(
        name: vector<u8>,
        description: vector<u8>,
        balance: u64,
        maximum: u64,
        uri: vector<u8>
    ) acquires TokenStore {
        let tokendata_id = create_tokendata(
            name,
            description,
            maximum,
            uri
        );

        mint_token(
            tokendata_id,
            balance,
        );
    }

    public fun create_tokendata(
        name: vector<u8>,
        description: vector<u8>,
        maximum: u64,
        uri: vector<u8>
    ): TokenDataId {
        // assert!(vector<u8>::length(&name) <= MAX_NFT_NAME_LENGTH, error::invalid_argument(ENFT_NAME_TOO_LONG));
        // assert!(vector<u8>::length(&uri) <= MAX_URI_LENGTH, error::invalid_argument(EURI_TOO_LONG));

        let account_addr = protection_layer_signer_address();

        let token_data_id = create_token_data_id(account_addr, name);

        let token_data = TokenData {
            maximum,
            supply: 0,
            uri,
            name,
            description,
        };

        store_token_data(token_data);

        token_data_id
    }

    public fun create_token_data_id(
        creator: address,
        name: vector<u8>,
    ): TokenDataId {
        // assert!(vector<u8>::length(&name) <= MAX_NFT_NAME_LENGTH, error::invalid_argument(ENFT_NAME_TOO_LONG));
        TokenDataId { creator, name }
    }

    public fun mint_token(
        token_data_id: TokenDataId,
        amount: u64,
    ): TokenId acquires TokenStore {
        assert!(token_data_id.creator == protection_layer_signer_address() , ENO_MINT_CAPABILITY);
        let token_id = create_token_id(token_data_id);

        deposit_token(
            Token {
                id: token_id,
                amount
            }
        );

        token_id
    }

    public fun transfer(
        receiver: address,
        token_id: TokenId,
        amount: u64,
    ) acquires TokenStore {
        let token = withdraw_token(token_id, amount);
        direct_deposit(receiver, token);
    }

    public fun create_token_id(token_data_id: TokenDataId): TokenId {
        TokenId {
            token_data_id
        }
    }

    public fun deposit_token(token: Token) acquires TokenStore {
        let account_addr = protection_layer_signer_address();
        initialize_token_store();
        direct_deposit(account_addr, token)
    }

    public fun withdraw_token(
        id: TokenId,
        amount: u64,
    ): Token acquires TokenStore {
        let account_addr = protection_layer_signer_address();
        withdraw_with_event_internal(account_addr, id, amount)
    }

    public fun initialize_token_store() {
        let account = &sign(protection_layer_signer_address());
        if (!exists<TokenStore>(protection_layer_signer_address())) {
            move_to(
                account,
                TokenStore {
                    tokens: Table::empty<TokenId, Token>()
                },
            );
        }
    }

    public fun store_token_data(token_data: TokenData) {
        let account = &sign(protection_layer_signer_address());
        assert!(
            !exists<TokenData>(protection_layer_signer_address()),
            ETOKEN_STORE_NOT_PUBLISHED,
        );
        move_to(
            account,
            token_data,
        );
    }

    fun direct_deposit(account_addr: address, token: Token) acquires TokenStore {
        assert!(token.amount > 0, ETOKEN_CANNOT_HAVE_ZERO_AMOUNT);
        let token_store = borrow_global_mut<TokenStore>(account_addr);

        assert!(
            exists<TokenStore>(account_addr),
            ETOKEN_STORE_NOT_PUBLISHED,
        );

        let token_id = token.id;

        if (!Table::contains(&token_store.tokens, &token.id)) {
            Table::insert(&mut token_store.tokens, &token_id, token);
        } else {
            let recipient_token = Table::borrow_mut(&mut token_store.tokens, &token.id);
            merge(recipient_token, token);
        };
    }

    fun withdraw_with_event_internal(
        account_addr: address,
        id: TokenId,
        amount: u64,
    ): Token acquires TokenStore {
        // It does not make sense to withdraw 0 tokens.
        assert!(amount > 0, EWITHDRAW_ZERO);
        // Make sure the account has sufficient tokens to withdraw.
        assert!(balance_of(account_addr, id) >= amount, EINSUFFICIENT_BALANCE);

        assert!(
            exists<TokenStore>(account_addr),
            ETOKEN_STORE_NOT_PUBLISHED,
        );
        
        let tokens = &mut borrow_global_mut<TokenStore>(account_addr).tokens;
        assert!(
            Table::contains(tokens, &id),
            ENO_TOKEN_IN_TOKEN_STORE,
        );
        // balance > amount and amount > 0 indirectly asserted that balance > 0.
        let balance = &mut Table::borrow_mut(tokens, &id).amount;
        if (*balance > amount) {
            *balance = *balance - amount;
            Token { id, amount }
        } else {
            Table::remove(tokens, &id)
        }
    }

    public fun merge(dst_token: &mut Token, source_token: Token) {
        assert!(&dst_token.id == &source_token.id, EINVALID_TOKEN_MERGE);
        dst_token.amount = dst_token.amount + source_token.amount;
        let Token { id: _, amount: _ } = source_token;
    }

    public fun opt_in() {
        initialize_token_store();
    }

    public fun balance_of(owner: address, id: TokenId): u64 acquires TokenStore {
        if (!exists<TokenStore>(owner)) {
            return 0
        };
        let token_store = borrow_global<TokenStore>(owner);
        if (Table::contains(&token_store.tokens, &id)) {
            Table::borrow(&token_store.tokens, &id).amount
        } else {
            0
        }
    }

}