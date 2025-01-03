module deploy_address::auction {
    use aptos_framework::coin::{Self, Coin}; //, MintCapability, BurnCapability, FreezeCapability};
    use aptos_framework::aptos_coin::{AptosCoin};
    use std::signer;
    // use std::string::{Self, String};

    struct Auction<phantom CoinType> has key {
        bid: Bid<CoinType>
    }

    struct Bid<phantom CoinType> has store {
        bidder: address,
        coin: Coin<CoinType>
    }

    public fun initialize(deployer: &signer) {
        let coins = coin::withdraw<AptosCoin>(deployer, 1000);
        let bid = Bid {
            bidder: signer::address_of(deployer),
            coin: coins
        };
        let auction = Auction { bid: bid };
        move_to(deployer, auction);
    }
}