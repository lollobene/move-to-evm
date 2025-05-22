module aptosize::hippo {

    public entry fun hello(user: &signer, run: bool) {
        if(run) {
            hippo_aggregator::aggregator::init_coin_store_all(user);
        }
    }

    public entry fun bye() {

    }
}
