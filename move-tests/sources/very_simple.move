module deploy_address::very_simple {

    struct Simple has key, store {
        a: u64
    }

    struct SimpleBytes has key{
        foo: vector<u8>
    }
    const A : u64 = 10;
    const B : u64 = 20;

    public fun create(_a: u64): Simple {
        let s = Simple {
            a: B
        };
        s
    }

    public fun write(acc: &signer, s: Simple) {
        move_to(acc, s);
    }

    public fun read(acc: address): u64 acquires Simple {
        let s = borrow_global<Simple>(acc);
        s.a
    }

    /*
    public fun read_mut(acc: &signer): u64 acquires Simple {
        let s = borrow_global_mut<Simple>(address_of(acc));
        s.a
    }
    */

    public fun read_immut(acc: address): u64 acquires Simple {
        let s = borrow_global<Simple>(acc);
        s.a
    }

    
    // THIS DOES NOT WORK
    /*
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

    public fun delete(acc: address) acquires Simple {
        let s = get(acc);
        destroy(s);
    }

    fun destroy(s: Simple) {
        let Simple { a: _ } = s;
    }

    fun loadBytes(acc: &signer, some_bytes: vector<u8>) {
        // let some_bytes = b"hello";
        let s = SimpleBytes {
            foo: some_bytes
        };
        move_to<SimpleBytes>(acc, s);
    }

    fun writeSimple(acc: &signer, s: Simple) {
        move_to(acc, s);
    }

    public fun writeMutable(ref: &mut Simple): &mut Simple {
        ref.a = B;
        ref
    }

    /*
    fun read_mut_addr(addr: address): &mut Simple acquires Simple {
        borrow_global_mut<Simple>(addr)
    }
    */

    fun give_me_ref() {
        let s = Simple {
            a: A
        };
        let mut_ref = &mut s;
        writeMutable(mut_ref);
        let Simple { a: _ } = s;
    }    

    /*
    public fun modify_stuff(acc: address) acquires Simple {
        let ref = read_mut_addr(acc);
        writeMutable(ref);
    }
    */

}