module deploy_address::leak_move_to {

    struct Simple has key, store {
        a: u64,
        b: bool
    }

    public fun g(): Simple {
        Simple {
            a: 42,
            b: true
        }
    }

    public fun leak(s: &mut Simple): &mut u64 {
        &mut s.a
    }

    /*
    public fun main(acc: address) {
        let res_ref = g(acc);
        let leaked_ref = leak(res_ref);
    }
    */
}