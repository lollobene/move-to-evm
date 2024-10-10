module other_address::moduleC {

    use deploy_address::moduleA::{A, read_struct, create as createA};

    struct C has key {
        c: A
    }

    public fun create(c: A): C {
        let s = C {
            c
        };
        s
    }

    public fun write(acc: &signer, s: C) {
        move_to(acc, s);
    }

    public fun read(acc: address): u64 acquires C {
        let s = borrow_global<C>(acc);
        read_struct(&s.c)
    }

    public fun get(acc: address): C acquires C {
        move_from<C>(acc)
    }

    public fun main(acc: &signer) {
        let c = create(createA(10, 44));
        write(acc, c);
    }
}