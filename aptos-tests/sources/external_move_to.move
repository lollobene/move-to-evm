module deploy_address::external_move_to {
    // use std::signer::address_of;
    use aptos_framework::coin::{Coin};
    // use deploy_address::simple::Simple;

    struct Wrapper<phantom CoinType> has key {
        c: Coin<CoinType>
    }
    public fun ext_move_to<CoinType>(acc: &signer, c: Coin<CoinType>) {
        move_to(acc, Wrapper{ c: c });
    }
}