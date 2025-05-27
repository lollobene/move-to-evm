module NAV::contract {

    use std::signer;

    // Struct to hold the total asset value and total token supply
    struct NAVData has key {
        total_asset_value: u64,    // Total value of assets
        total_token_supply: u64,   // Total supply of the token
    }

    // Initialize the NAV data for an account
    public fun init_nav(account: &signer) {
        let nav_data = NAVData {
            total_asset_value: 0,
            total_token_supply: 0,
        };
        move_to(account, nav_data);
    }

    // Function to update the total asset value
    public fun update_asset_value(account: &signer, new_asset_value: u64) acquires NAVData {
        let nav_data = borrow_global_mut<NAVData>(signer::address_of(account));
        nav_data.total_asset_value = new_asset_value;
    }

    // Function to update the total token supply
    public fun update_token_supply(account: &signer, new_token_supply: u64) acquires NAVData {
        let nav_data = borrow_global_mut<NAVData>(signer::address_of(account));
        nav_data.total_token_supply = new_token_supply;
    }

    // Function to calculate the NAV
    public fun calculate_nav(account: &signer): u64 acquires NAVData {
        let nav_data = borrow_global<NAVData>(signer::address_of(account));
        if (nav_data.total_token_supply > 0) {
            nav_data.total_asset_value / nav_data.total_token_supply
        } else {
            0 // Return 0 if token supply is zero to avoid division by zero
        }
    }
}
