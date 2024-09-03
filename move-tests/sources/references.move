module deploy_address::references {

    struct Simple has key {
        a: u64
    }

    public fun create_simple(a: u64): Simple {
        Simple { a }
    }

    public fun set_simple(s: &mut Simple, a: u64) {
        let ref_copy = s;
        s.a = a;
    }

    public fun destroy_simple(s: Simple) {
        let Simple { a: _ } = s;
    }

    public fun main() {
        let s = create_simple(42);
        set_simple(&mut s, 43);
        destroy_simple(s);
    }

}