module deploy_address::amm_simple {
    use aptos_framework::coin::{Self, Coin, MintCapability, BurnCapability, FreezeCapability};
    use std::signer;
    use std::string::{Self, String};

    struct LiquidityPool<CoinType1, CoinType2> has key {
        coin1: Coin<CoinType1>,
        coin2: Coin<CoinType2>,
    }

    struct PoolTokenCaps has key {
        mint_cap: MintCapability<PoolToken>,
        burn_cap: BurnCapability<PoolToken>,
        freeze_cap: FreezeCapability<PoolToken>
    }

    struct PoolToken has store {}

    public fun create_pool<CoinType1: store, CoinType2: store>(
        liquidity_pool_owner: &signer,
        coin1: Coin<CoinType1>,
        coin2: Coin<CoinType2>,
    ) {
        let share = coin::value(&coin1) / coin::value(&coin2);
        assert!(signer::address_of(liquidity_pool_owner) == @deploy_address, 0);
        let (burn_cap, freeze_cap, mint_cap) = coin::initialize<PoolToken>(
            liquidity_pool_owner,
            string::utf8(b"Pool Token"),
            string::utf8(b"PT"),
            8,
            false
        );
        let pool_tokens = coin::mint<PoolToken>(share, &mint_cap);
        coin::register<PoolToken>(liquidity_pool_owner);
        let pool_token_caps = PoolTokenCaps {
            mint_cap,
            burn_cap,
            freeze_cap
        };
        coin::deposit<PoolToken>(signer::address_of(liquidity_pool_owner), pool_tokens);
        move_to(liquidity_pool_owner, pool_token_caps);
        let lp = LiquidityPool {
            coin1,
            coin2,
        };
        move_to(liquidity_pool_owner, lp);
    }

    public fun add_liquidity<CoinType1: store, CoinType2: store>(
        acc: &signer,
        coin1: Coin<CoinType1>,
        coin2: Coin<CoinType2>,
    ) acquires LiquidityPool, PoolTokenCaps {
        let lp = borrow_global_mut<LiquidityPool<CoinType1, CoinType2>>(@deploy_address);
        let c1_val = coin::value(&coin1);
        let c2_val = coin::value(&coin2);
        coin::merge(&mut lp.coin1, coin1);
        coin::merge(&mut lp.coin2, coin2);
        
        let pool_token_caps = borrow_global_mut<PoolTokenCaps>(@deploy_address);
        let pool_tokens = coin::mint<PoolToken>(c1_val / c2_val, &pool_token_caps.mint_cap);
        coin::register<PoolToken>(acc);
        coin::deposit<PoolToken>(signer::address_of(acc), pool_tokens);
    }

    public fun swap_c1_to_c2<CoinType1: store, CoinType2: store>(
        acc: &signer,
        coin1: Coin<CoinType1>,
    ): Coin<CoinType2> acquires LiquidityPool {
        let lp = borrow_global_mut<LiquidityPool<CoinType1, CoinType2>>(@deploy_address);
        let c1_val = coin::value(&coin1);
        coin::merge(&mut lp.coin1, coin1);
        let coin2 = coin::extract(&mut lp.coin2, c1_val);
        coin2
    }

    public fun swap_c2_to_c1<CoinType1: store, CoinType2: store>(
        acc: &signer,
        coin2: Coin<CoinType2>,
    ): Coin<CoinType1> acquires LiquidityPool {
        let lp = borrow_global_mut<LiquidityPool<CoinType1, CoinType2>>(@deploy_address);
        let c2_val = coin::value(&coin2);
        coin::merge(&mut lp.coin2, coin2);
        let coin1 = coin::extract(&mut lp.coin1, c2_val);
        coin1
    }

    public fun remove_liquidity<CoinType1: store, CoinType2: store>(
        acc: &signer
    ): (Coin<CoinType1>, Coin<CoinType2>) acquires LiquidityPool, PoolTokenCaps {
        let lp = borrow_global_mut<LiquidityPool<CoinType1, CoinType2>>(@deploy_address);
        let pool_token_caps = borrow_global_mut<PoolTokenCaps>(@deploy_address);
        let pool_tokens = coin::withdraw<PoolToken>(acc, 100);
        let pool_token_val = coin::value(&pool_tokens);
        
        let coin1 = coin::extract(&mut lp.coin1, pool_token_val);
        let coin2 = coin::extract(&mut lp.coin2, pool_token_val);
        coin::burn<PoolToken>(pool_tokens, &pool_token_caps.burn_cap);
        (coin1, coin2)
    }
}