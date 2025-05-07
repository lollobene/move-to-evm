module deploy_address::generic_call {
    use deploy_address::generic_callee::generic_fun;

    public fun main<T: store>(acc: &signer, s: T) {
        generic_fun<T>(acc, s);
    }
}

module deploy_address::generic_callee {

    struct Container<T> has key, store {
        s: T
    }

    public fun generic_fun<T: store>(acc: &signer, s: T) {
        move_to<Container<T>>(acc, generic_stuff(s));
    }

    fun generic_stuff<T>(s: T) : Container<T> {
        Container { s }
    }
}