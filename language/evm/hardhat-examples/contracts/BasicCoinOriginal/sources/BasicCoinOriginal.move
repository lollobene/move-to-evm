#[evm_contract]
module Evm::basic_coin_original {
    use Evm::Evm::{sender, sign, require /*address_of,*/};
    use Evm::U256::{U256, add, sub, zero, le};

    #[abi_struct(sig=b"Coin(uint256)")]
    struct Coin has key {
        value: U256
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
        let account_addr = sender();
        assert!(exists<MintCapability>(account_addr), 0);
    }

    #[callable(sig=b"register()")]
    public fun register() {
        let acc = sender();
        let coin = Coin { value: zero() };
        move_to(&sign(acc), coin);
    }

    #[callable(sig=b"transfer(address, uint256)")]
    public fun transfer(
        to: address,
        amount: U256,
    ) acquires Coin {
        require(to != @0x0, b"transfer to the zero address");
        let sender_coin = withdraw(amount);
        deposit(to, sender_coin);
    }

    // Here the 'from: &signer' parameter was removed 
    // and used protection_layer_signer_address() instead
    #[callable(sig=b"withdraw(uint256) returns (Coin)")]
    public fun withdraw (
        amount: U256
    ): Coin acquires Coin {
        let account_addr = sender();
        let coin = borrow_global_mut<Coin>(account_addr);
        require(le(amount, coin.value), b"ERC20: transfer amount exceeds balance");
        coin.value = sub(coin.value, amount);
        Coin { value: amount }
    }

    #[callable(sig=b"deposit(address, Coin)")]
    public fun deposit (
        to: address,
        coin: Coin
    ) acquires Coin {
        let Coin { value } = coin;
        let coin = borrow_global_mut<Coin>(to);
        coin.value = add(coin.value, value);
    }

    // Here the 'from: &signer' parameter was removed 
    // and used protection_layer_signer_address() instead
    #[callable(sig=b"mint(uint256) returns (Coin)")]
    public fun mint(amount: U256): Coin {
        let account_addr = sender();
        assert!(exists<MintCapability>(account_addr), 0);
        Coin { value: amount }
    }

    #[callable(sig=b"mintTo(uint256,address)")]
    public fun mint_to(amount: U256, to: address) acquires Coin {
        let account_addr = sender();
        assert!(exists<MintCapability>(account_addr), 0);
        deposit(to, Coin { value: amount })
    }

    #[callable(sig=b"getBalance(address) returns (uint256)"), view]
    public fun get_balance(account: address): U256 acquires Coin{
        let coin = borrow_global<Coin>(account);
        coin.value
    }

    #[callable(sig=b"doNothing()")]
    public fun do_nothing() {}
} 