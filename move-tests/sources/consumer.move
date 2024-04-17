module deploy_address::consumer {
    use std::signer::address_of;
    use deploy_address::simple::{Self, Simple, get, multiple_get};

    struct Consumer has key {
        s: Simple
    }

    public fun create(s: Simple): Consumer {
        let c = Consumer {
            s
        };
        c
    }

    public fun write(acc: &signer, c: Consumer) {
        move_to(acc, c);
    }

    public fun double_get(acc: &signer, addr1: address, addr2: address) {
        let s1 = get(addr1);
        let s2 = get(addr2);
        simple::write(acc, s1);
        simple::write(acc, s2);
    }

    public fun double_get2(acc: &signer, addr1: address, addr2: address) {
        let (s1, s2) = multiple_get(addr1, addr2);
        simple::write(acc, s1);
        simple::write(acc, s2);
    }

    /*
    CAN'T DO THIS because Global storage access is internal to the module
    public fun read(acc: signer): u64 acquires Simple {
        let s = borrow_global<Simple>(address_of(&acc));
        s.a
    }
    
    public fun create(a: u64): Simple {
        let s = Simple {
            a
        };
        s
    }

    public fun write(acc: signer, s: Simple) {
        move_to(&acc, s);
    }


    public fun read_mut(acc: signer): u64 acquires Simple {
        let s = borrow_global_mut<Simple>(address_of(&acc));
        s.a
    }

    public fun delete(acc: signer) acquires Simple {
        let s = move_from<Simple>(address_of(&acc));
        destroy(s);
    }

    fun destroy(s: Simple) {
        let Simple { a: _ } = s;
    }
    */

}