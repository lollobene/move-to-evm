module deploy_address::leak {

    struct Simple has store {
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
    public fun leakRef(s: &mut Simple): &Simple {
        let ref = s;
        ref
    }

    public fun foo(s: Simple): &Simple {
        let x = leakRef(&mut s);
        let Simple { a, b } = s;
        x
    }

    */
    /*
    public fun main(acc: address) {
        let res_ref = g(acc);
        let leaked_ref = leak(res_ref);
    }
    */
}