module token_addr::TokenModule {

    use std::signer;

    struct Balance has key {
        amount: u64,
    }

    public fun initialize_balance(account: &signer, initial_amount: u64) {
        let balance = Balance { amount: initial_amount };
        move_to(account, balance);
    }

    public fun initialize_token_store(account: &signer) {
        initialize_balance(account, 0)  // Initialize with 0 tokens by default
    }

    public fun transfer(admin: &signer, recipient: address, amount: u64) acquires Balance {
        assert!(amount > 0, 1001);

        let admin_address = signer::address_of(admin);
        assert!(admin_address != recipient, 1003);

        let admin_balance = borrow_global_mut<Balance>(admin_address);
        assert!(admin_balance.amount >= amount, 1002);
        admin_balance.amount = admin_balance.amount - amount;

        let recipient_balance = borrow_global_mut<Balance>(recipient);
        recipient_balance.amount = recipient_balance.amount + amount;
    }

    public fun get_balance(account: address): u64 acquires Balance {
        let balance = borrow_global<Balance>(account);
        balance.amount
    }
} 