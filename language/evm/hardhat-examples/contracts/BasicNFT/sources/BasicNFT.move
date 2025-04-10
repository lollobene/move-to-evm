#[evm_contract]
module Evm::basic_nft {
    use Evm::Evm::{sender, sign, /*require,*/ /*address_of,*/ protection_layer_signer_address};
    // use Evm::U256::{U256, zero, u256_from_u128, le};
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
    const EINVALID_TOKEN_ID: u64 = 0xB;
    const MAX_NFT_NAME_LENGTH: u64 = 32;
    const MAX_URI_LENGTH: u64 = 256;

    struct Token has store {
        id: u64,
    }

    struct TokenData has key {
        supply: u64,
        uri: vector<u8>,
        name: vector<u8>,
        id_counter: u64
    }

    /// Represents token resources owned by token owner
    struct TokenStore has key {
        tokens: Table<u64, Token>,
        amount: u64
    }

    struct MintCapability has key {}

    #[create(sig=b"constructor()")]
    public fun create() {
        move_to(&sign(sender()), MintCapability {});
    }

    #[callable(sig=b"hasMintCapability(address) returns (bool)"), view]
    public fun has_mint_capability(account: address): bool {
        exists<MintCapability>(account)
    }

    #[callable(sig=b"mintCapability()"), view]
    public fun mint_capability() {
        let account_addr = protection_layer_signer_address();
        assert!(exists<MintCapability>(account_addr), EMINT_CAPABILITY_NOT_PUBLISHED);
    }

    // create token with raw inputs
    #[callable(sig=b"initToken(string, string)")]
    public fun init_token(
        name: vector<u8>,
        uri: vector<u8>
    ) acquires TokenStore, TokenData {
        let account_addr = protection_layer_signer_address();
        assert!(exists<MintCapability>(account_addr), EMINT_CAPABILITY_NOT_PUBLISHED);

        let first_token_id = init_tokendata(
            name,
            uri
        );

        initialize_token_store();

        mint(
            first_token_id,
            account_addr
        );
    }

    // Create a new token data
    fun init_tokendata(
        name: vector<u8>,
        uri: vector<u8>
    ) : u64 {
        let account = &sign(protection_layer_signer_address());
        assert!(
            !exists<TokenData>(protection_layer_signer_address()),
            ETOKEN_STORE_NOT_PUBLISHED,
        );

        let token_data = TokenData {
            supply: 0,
            uri,
            name,
            id_counter: 1,
        };

        let token_id = token_data.id_counter;

        move_to(
            account,
            token_data,
        );

        token_id
    }

    #[callable(sig=b"mint(uint64, address)")]
    public fun mint(
        token_id: u64,
        to: address
    ) acquires TokenStore, TokenData {
        let account_addr = protection_layer_signer_address();
        assert!(exists<MintCapability>(account_addr), EMINT_CAPABILITY_NOT_PUBLISHED);
        // assert!(token_data_id.creator == account_addr , ENO_MINT_CAPABILITY);
        let token_data = borrow_global_mut<TokenData>(account_addr);
        assert!(
            token_data.id_counter == token_id,
            EINVALID_TOKEN_ID
        );

        token_data.id_counter = token_data.id_counter + 1;

        deposit(
            to,
            Token {
                id: token_id,
            }
        );
    }

    #[callable(sig=b"transfer(address, uint64)")]
    public fun transfer(
        to: address,
        token_id: u64,
    ) acquires TokenStore {
        let token = withdraw(token_id);
        deposit(to, token);
    }

    // #[callable(sig=b"depositToken(uint256)")]
    // public fun deposit_token(token: Token) acquires TokenStore {
    //     let account_addr = protection_layer_signer_address();
    //     initialize_token_store();
    //     deposit(account_addr, token)
    // }

    #[callable(sig=b"withdraw(uint64) returns (uint256)")]
    public fun withdraw(
        id: u64,
    ): Token acquires TokenStore {
        let account_addr = protection_layer_signer_address();
        withdraw_internal(account_addr, id)
    }

    fun initialize_token_store() {
        let account = &sign(protection_layer_signer_address());
        if (!exists<TokenStore>(protection_layer_signer_address())) {
            move_to(
                account,
                TokenStore {
                    tokens: Table::empty<u64, Token>(),
                    amount: 0
                },
            );
        }
    }

    #[callable(sig=b"deposit(address, uint256)")]
    public fun deposit(account_addr: address, token: Token) acquires TokenStore {
        assert!(
            exists<TokenStore>(account_addr),
            ETOKEN_STORE_NOT_PUBLISHED,
        );

        let token_store = borrow_global_mut<TokenStore>(account_addr);
        let token_id = token.id;

        
        Table::insert(&mut token_store.tokens, &token_id, token);
        
    }

    fun withdraw_internal(
        account_addr: address,
        id: u64
    ): Token acquires TokenStore {
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
        
        Table::remove(tokens, &id)
        
    }

    #[callable(sig=b"register()")]
    public fun register() {
        initialize_token_store();
    }

    #[callable(sig=b"balanceOf(address) returns (uint64)"), view]
    public fun balance_of(owner: address): u64 acquires TokenStore {
        if (!exists<TokenStore>(owner)) {
            return 0
        };
        let token_store = borrow_global<TokenStore>(owner);
        token_store.amount
    }

}