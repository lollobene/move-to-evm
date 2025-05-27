//new pumpfun coin moshiach

module MyToken::Token {
    use std::signer;



    struct Token has key {
        balance: u64,
    }

    public fun initialize(account: &signer) {
        // Initialize the token for a new account with a balance of 0
        move_to(account, Token { balance: 0 });
    }

    public fun mint(account: &signer, amount: u64) acquires Token {
        // Mint tokens to the account
        let token_ref = borrow_global_mut<Token>(signer::address_of(account));
        token_ref.balance = token_ref.balance + amount;
    }

    public fun transfer(sender: &signer, receiver: address, amount: u64) acquires Token {
        let sender_ref = borrow_global_mut<Token>(signer::address_of(sender));
        assert!(sender_ref.balance >= amount, 100); // Ensure the sender has enough balance
        sender_ref.balance = sender_ref.balance - amount;

        let receiver_ref = borrow_global_mut<Token>(receiver);
        receiver_ref.balance = receiver_ref.balance + amount;
    }

    public fun balance_of(account: address): u64 acquires Token {
        // Return the balance of the specified account
        let token_ref = borrow_global<Token>(account);
        token_ref.balance
    }
}
