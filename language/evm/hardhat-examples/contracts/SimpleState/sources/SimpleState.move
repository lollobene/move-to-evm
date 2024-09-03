#[evm_contract]
module Evm::SimpleState {
    use Evm::Evm::{self, block_number, sender, value, sign};
    use Evm::U256::{Self, U256, zero};
    
    struct State has key {
        val: U256,
    }

    struct ByteState has key {
        bytes: vector<u8>,
    }

    #[create(sig=b"constructor(uint256,address)")]
    public fun create(val: U256, addr: address){
        let state = State {
            val
        };
        move_to<State>(&sign(addr), state);
    }

    #[callable(sig=b"set(uint256,address)")]
    public fun set(val: U256, addr: address) acquires State {
        let s = borrow_global_mut<State>(addr);
        s.val = val;
    }
    
    #[callable(sig=b"get(address) returns (uint256)"), view]
    public fun get(addr: address): U256 acquires State {
        let s = borrow_global<State>(addr);
        s.val
    }

    #[callable(sig=b"remove(address)"), view]
    public fun remove(addr: address) acquires State {
        let s = move_from<State>(addr);
        let State{ val: _ } = s;
    }

    #[callable(sig=b"loadBytes(address)")]
    public fun loadBytes(addr: address) {
        let bytes = b"Hello, World!";
        let state = ByteState {
            bytes
        };
        state = doSomething(state);
        move_to<ByteState>(&sign(addr), state);
    }

    fun doSomething(state: ByteState): ByteState {
        state.bytes = b"Edited";
        state
    }
}