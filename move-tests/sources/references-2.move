module deploy_address::B {
    use deploy_address::A::{Self, RA, giveMe};

    struct RB has key{
        ra: RA
    }

    public fun giveBack(a: address) acquires RB{
        let rb = borrow_global_mut<RB>(a);
        giveMe(&mut rb.ra);
    }

    public fun giveBack2(a: RA): RA {
        giveMe(&mut a);
        return a
    }
}

module deploy_address::A {
    
    struct RA has store {
        bar: u64
    }

    public fun giveMe(a: &mut RA) {
        a.bar = 42;
    }
}
