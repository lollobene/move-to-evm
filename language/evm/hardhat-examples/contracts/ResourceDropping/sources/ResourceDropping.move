#[evm_contract]
module Evm::SimpleState {
    use Evm::Evm::{self, block_number, sender, value, sign};
    use Evm::U256::{Self, U256, zero};

    #[abi_struct(sig=b"DroppedRes(uint256,uint256)")]
    struct DroppedRes has key {
        val: U256,
        val2: U256
    }

    #[create(sig=b"constructor(uint256,address)")]
    public fun init_module(val: U256, addr: address){
        let res = DroppedRes {
            val,
            val2: val
        };
        move_to<DroppedRes>(&sign(addr), res);
    }

    #[callable(sig=b"allocate(uint256)")]
    public fun allocate(val: U256) {
        let res = DroppedRes {
            val,
            val2: val
        };
        move_to<DroppedRes>(&sign(sender()), res);
    }

    #[callable(sig=b"set(uint256,address)")]
    public fun set(val: U256, addr: address) acquires DroppedRes {
        let s = borrow_global_mut<DroppedRes>(addr);
        s.val = val;
    }

    #[callable(sig=b"edit(uint256)")]
    public fun edit(val: U256, res_ref: &mut DroppedRes) {
        res_ref.val = val;
    }
    
    #[callable(sig=b"read(address) returns (uint256)"), view]
    public fun read(addr: address): U256 acquires DroppedRes {
        let s = borrow_global<DroppedRes>(addr);
        s.val
    }

    #[callable(sig=b"remove(address)")]
    public fun remove(addr: address) acquires DroppedRes {
        let s = move_from<DroppedRes>(addr);
        let DroppedRes{ val: _, val2: _ } = s;
    }

    #[callable(sig=b"sink(DroppedRes)")]
      fun sink(res: DroppedRes) {
        let DroppedRes{ val: _, val2: _ } = res;
    }

    #[callable(sig=b"dropRes() returns (DroppedRes)"), view]
    public fun dropRes() : DroppedRes {
        let res = DroppedRes {
            val: zero(),
            val2: zero()
        };
        res
    }

    #[callable(sig=b"dropResFromStorage(address) returns (DroppedRes)")]
    public fun dropResFromStorage(addr: address) : DroppedRes acquires DroppedRes {
        let res = move_from<DroppedRes>(addr);
        res
    }
}