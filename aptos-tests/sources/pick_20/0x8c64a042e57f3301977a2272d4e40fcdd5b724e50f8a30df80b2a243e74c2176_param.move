module NamedAddress::param {
    use std::string::String;

    public entry fun batch_mint_token(
        from: &signer,
        collection_name: String,
        token_names: vector<String>,
        token_uris: vector<String>,
        token_des: String
    ) {

    }
}
