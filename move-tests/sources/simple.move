module deploy_address::simple {
    use std::signer::address_of;

    struct Simple has key, store {
        a: u64
    }

    public fun create(a: u64): Simple {
        let s = Simple {
            a
        };
        s
    }

    public fun write(acc: &signer, s: Simple) {
        move_to(acc, s);
    }

    public fun read(acc: &signer): u64 acquires Simple {
        let s = borrow_global<Simple>(address_of(acc));
        s.a
    }

    public fun read_mut(acc: &signer): u64 acquires Simple {
        let s = borrow_global_mut<Simple>(address_of(acc));
        s.a
    }

    /*
     THIS DOES NOT WORK
    
    public fun read_mut_addr(addr: address): &mut Simple acquires Simple {
        let s = borrow_global_mut<Simple>(addr);
        s
    }
    */

    /*
     THIS DOES NOT WORK
    
    public fun swap(addr1: address, addr2: address) acquires Simple {
        let s1 = borrow_global_mut<Simple>(addr1);
        let s2 = borrow_global_mut<Simple>(addr2);
        let temp = s1.a;
        s1.a = s2.a;
        s2.a = temp;
    }
    */

    public fun get(addr: address): Simple acquires Simple {
        move_from<Simple>(addr)
    }

    public fun multiple_get(addr1: address, addr2: address): (Simple, Simple) acquires Simple {
        let s1 = move_from<Simple>(addr1);
        let s2 = move_from<Simple>(addr2);
        (s1, s2)
    }

    public fun delete(acc: &signer) acquires Simple {
        let s = get(address_of(acc));
        destroy(s);
    }

    fun destroy(s: Simple) {
        let Simple { a: _ } = s;
    }

}