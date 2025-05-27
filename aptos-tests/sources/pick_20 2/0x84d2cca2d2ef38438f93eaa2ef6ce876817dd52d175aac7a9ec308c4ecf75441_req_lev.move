module req_lev::req_lev {
    use std::signer;
    use std::string::String;

    struct PerpMarket has key {
        name: String,
        base_token: String,
        quote_token: String,
        base_token_decimals: u8,
        quote_token_decimals: u8,
        min_base_token_amount: u64,
        min_quote_token_amount: u64,
        max_base_token_amount: u64,
        max_quote_token_amount: u64,
    }

    public entry fun create_perp_market(
        account: &signer,
        name: String,
        base_token: String,
        quote_token: String,
        base_token_decimals: u8,
        quote_token_decimals: u8,
        min_base_token_amount: u64,
        min_quote_token_amount: u64,
        max_base_token_amount: u64,
        max_quote_token_amount: u64,
    ) {
        let account_addr = signer::address_of(account);
        assert!(!exists<PerpMarket>(account_addr), 0);
        move_to(account, PerpMarket {
            name,
            base_token,
            quote_token,
            base_token_decimals,
            quote_token_decimals,
            min_base_token_amount,
            min_quote_token_amount,
            max_base_token_amount,
            max_quote_token_amount,
        });
    }
}
