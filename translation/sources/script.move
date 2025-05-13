script {
    use deploy_address::moduleA::{create as createA};
    use deploy_address::moduleB::{create as createB, read as readB, write};
    use std::signer::address_of;

    fun main(caller: &signer) {
        let a = createA(10, 44);
        let b = createB(20, a);
        write(caller, b);

        let b = readB(address_of(caller));
        assert!(b == 20, 0);
    }
}