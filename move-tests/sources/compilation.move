module deploy_address::compilation {
    use std::signer::address_of;

    struct Simple has key {
        a: u64
    }

    fun create(a: u64): Simple {
        Simple {
            a
        }
    }

    fun write(acc: &signer, s: Simple) {
        move_to(acc, s);
    }
    
    fun read_mut(acc: &signer): u64 acquires Simple {
        let s = borrow_global_mut<Simple>(address_of(acc));
        s.a
    }

    fun read_immut(acc: &signer): u64 acquires Simple {
        let s = borrow_global<Simple>(address_of(acc));
        s.a
    }

    
    // THIS DOES NOT WORK
    /*
    fun read_mut_addr(addr: address): &mut Simple acquires Simple {
        let s = borrow_global_mut<Simple>(addr);
        s
    }
    */
    /*
     THIS DOES NOT WORK
    
    fun swap(addr1: address, addr2: address) acquires Simple {
        let s1 = borrow_global_mut<Simple>(addr1);
        let s2 = borrow_global_mut<Simple>(addr2);
        let temp = s1.a;
        s1.a = s2.a;
        s2.a = temp;
    }
    */

    fun get(addr: address): Simple acquires Simple {
        move_from<Simple>(addr)
    }

    fun multiple_get(addr1: address, addr2: address): (Simple, Simple) acquires Simple {
        let s1 = move_from<Simple>(addr1);
        let s2 = move_from<Simple>(addr2);
        (s1, s2)
    }

    fun delete(acc: &signer) acquires Simple {
        let s = get(address_of(acc));
        destroy(s);
    }

    fun destroy(s: Simple) {
        let Simple { a: _ } = s;
    }

    fun edit(ref: &mut Simple): &mut Simple {
        ref.a = 10;
        ref
    }

    /*
    fun read_mut_addr(addr: address): &mut Simple acquires Simple {
        borrow_global_mut<Simple>(addr)
    }
    */

    /*
    fun give_me_ref() {
        let s = Simple {
            a: 10
        };
        let mut_ref = &mut s;
        edit(mut_ref);
        let Simple { a: _ } = s;
    }
    */

    /*
    fun modify_stuff(acc: address) acquires Simple {
        let ref = read_mut_addr(acc);
        writeMutable(ref);
    }
    */

    fun main (acc: &signer, b: u64, c: u64, d: u64): u64 acquires Simple {
        let a = b;
        if (a > 10) {
            a = 20 + c + d;
        };
        let s = Simple {
            a
        };
        move_to(acc, s);
        let a = read_mut(acc);
        a
    }


}