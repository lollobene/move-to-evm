module deploy_address::moduleA {

    struct A has key, store {
        a: u64
    }

    public fun create(a: u64): A {
        let s = A {
            a
        };
        s
    }

    public fun write(acc: &signer, s: A) {
        move_to(acc, s);
    }

    public fun read(acc: address): u64 acquires A {
        let s = borrow_global<A>(acc);
        s.a
    }

    public fun read_struct(ref: &A): u64 {
        ref.a
    }

    public fun get(acc: address): A acquires A {
        move_from<A>(acc)
    }

    public fun main(acc: &signer) {
        let a = create(10);
        write(acc, a);
    }
}

module deploy_address::moduleB {

    use deploy_address::moduleA::{A, read_struct};

    struct B has key {
        a: A,
        b: u64
    }

    public fun create(b: u64, a: A ): B {
        let s = B {
            b,
            a
        };
        s
    }

    public fun write(acc: &signer, s: B) {
        move_to(acc, s);
    }

    public fun read(acc: address): (u64) acquires B {
        let s = borrow_global<B>(acc);
        read_struct(&s.a)
    }

    public fun get(acc: address): B acquires B {
        move_from<B>(acc)
    }
}


