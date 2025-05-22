module sample::MultiAdmin {
    use std::signer;

    struct AdminData has key, store {
        admin: address,
    }

    fun init_module(sender: &signer) {
        let curr_signer = signer::address_of(sender);
        move_to(sender, AdminData {
            admin: curr_signer,
        });
    }

    public entry fun set_admin(sender: &signer, new_admin: address) acquires AdminData {
        let admin_data = borrow_global_mut<AdminData>(@sample);
        assert!(admin_data.admin == signer::address_of(sender), 0);
        admin_data.admin = new_admin;
    }

}
