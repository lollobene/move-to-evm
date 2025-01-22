#[evm_contract]
module Evm::protection_layer_costs {
    use Evm::Evm::{sender, sign, require, /*address_of,*/ protection_layer_signer_address};
    use Evm::U256::{U256, add, sub, zero, u256_from_u128, le};


    struct Counter has key {
        value: u64,
    }

    #[callable(sig=b"incrementCounter(address)")]
    /// Increment the value in resource Counter 
    public fun increment_counter(account: address) acquires Counter {
        let counter = borrow_global_mut<Counter>(account);
        counter.value = counter.value + 1;
    }

    /// Expected properties of increment_counter
    spec increment_counter {
        aborts_if borrow_global<Counter>((account)).value 
            == MAX_U64;
        aborts_if !exists<Counter>((account));
        // Postcondition: The value of the counter is incremented by 1
        ensures borrow_global<Counter>((account)).value 
                == old(global<Counter>((account)).value) + 1;
    }
}