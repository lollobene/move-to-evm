#[evm_contract]
module Evm::external_call_coin {
    use Evm::Evm::{sign, self, protection_layer_signer_address/*require address_of,*/};
    use Evm::U256::{U256/*, add, sub, zero, le*/};
    // use Evm::basicCoin::{Coin};

    struct CoinId has store, copy {
        id: U256,
    }

    #[external(sig=b"withdraw(uint256) returns (uint256)")]
    public native fun withdraw (contract: address, amount: U256): CoinId;

    #[external(sig=b"store_external(uint256)")]
    public native fun store_external(contract: address, coin: CoinId);

    struct State has key {
        coin_address: address
    }

    struct Bid has key {
        coin: CoinId,
    }

    #[create(sig=b"constructor(address)")]
    public fun create(coin_address: address) {
        let state = State {
            coin_address: coin_address
        };
        move_to(&sign(self()), state);
    }

    #[callable(sig=b"bid(uint256)")]
    public fun bid(amount: U256) acquires State {
        let state = borrow_global_mut<State>(self());
        let coin = withdraw(state.coin_address, amount);
        store_external(state.coin_address, coin);
        let acc = protection_layer_signer_address();
        move_to(&sign(acc), Bid { coin });
    }
}