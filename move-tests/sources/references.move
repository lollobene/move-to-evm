module deploy_address::references {

    struct Simple has key {
        a: u64
    }

    public fun create_simple(a: u64): Simple {
        Simple { a }
    }

    public fun set_simple(s: &mut Simple, a: u64) {
        s.a = a;
    }

    public fun destroy_simple(s: Simple) {
        let Simple { a: _ } = s;
    }

    public fun allocate_simple(acc: &signer, s: Simple) {
        move_to<Simple>(acc, s);
    }

    public fun main() {
        let s = create_simple(42);
        set_simple(&mut s, 43);
        destroy_simple(s);
    }

    /*
    Double borrow is not allowed
    
    public fun doubleBorrow(acc: address) acquires Simple {
        let s = borrow_global_mut<Simple>(acc);
        let s2 = borrow_global_mut<Simple>(acc);
        s.a = 43;
        s2.a = 47;
    }
    */

    /*
    Return reference is not allowed
    
    public fun returnReference(acc: address): &mut Simple acquires Simple {
        let s = borrow_global_mut<Simple>(acc);
        return s
    }
    */

    /*
    Return reference is not allowed

    public fun returnReference(s: Simple): &mut Simple {
        return &mut s
    }
    */

    public fun returnReference(s: &mut Simple): &mut Simple {
        s.a = 47;
        s
    }

    public fun passReference(s: Simple): Simple {
        let ref = returnReference(&mut s);
        ref.a = 48;
        s
    }
    
    public fun passReference2(acc: address) acquires Simple {
        let ref = borrow_global_mut<Simple>(acc);
        ref = returnReference(ref);
        ref.a = 48;
    }

    public fun eatReference(s: &mut Simple) {
        s.a = 48;
    }

    public fun passReference3(acc: address) acquires Simple {
        let ref = borrow_global_mut<Simple>(acc);
        eatReference(ref);
        let ref2 = borrow_global_mut<Simple>(acc);
        eatReference(ref2);
    }

    public fun doubleReference2(acc: address) acquires Simple {
        let ref = borrow_global_mut<Simple>(acc);
        ref.a = 47;
        let ref2 = borrow_global_mut<Simple>(acc);
        ref2.a=49;
    }

    /*
    Reference artimetics are not allowed
    public fun referenceAritmetics(acc: address) acquires Simple {
        let ref = borrow_global_mut<Simple>(acc);
        ref = ref+3;
    }
    */

    public fun returnFieldReference(ref: &mut Simple): &mut u64 {
        return &mut ref.a
    }

}

module deploy_address::referencesTest {
    use deploy_address::references::{Self, Simple};
    use std::signer;

    public fun test1() {
        let s: Simple = references::create_simple(42);
        references::eatReference(&mut s);
        references::eatReference(&mut s);
        references::destroy_simple(s);
    }

    public fun test2() {
        let s = references::create_simple(42);
        let s2 = references::passReference(s);
        references::destroy_simple(s2);
    }

    public fun test3(acc: &signer) {
        let s = references::create_simple(42);
        references::passReference2(signer::address_of(acc));
        references::destroy_simple(s);
    }

    public fun test4(acc: &signer) {
        let s = references::create_simple(42);
        references::passReference3(signer::address_of(acc));
        references::destroy_simple(s);
    }

    public fun test5() {
        let s = references::create_simple(42);
        let ref = references::returnFieldReference(&mut s);
        *ref = 47;
        references::destroy_simple(s);
    }
}