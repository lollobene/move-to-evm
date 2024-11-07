// Copyright (c) The Diem Core Contributors
// Copyright (c) The Move Contributors
// SPDX-License-Identifier: Apache-2.0

macro_rules! protection_layer_functions {
    ($($name:ident: $def:literal $(dep $dep:ident)*),* $(, )?) => {
        #[derive(PartialEq, Eq, PartialOrd, Ord, Clone, Copy, Debug, Hash)]
        #[allow(dead_code)]
        pub enum YulProtectionFunction {
            $($name,)*
        }
        impl YulProtectionFunction {
            #[allow(dead_code)]
            pub fn yule_name(self) -> String {
                match self {
                $(
                    YulProtectionFunction::$name => make_yule_name(stringify!($name)),
                )*
                }
            }
            #[allow(dead_code)]
            pub fn yule_def(self) -> String {
                match self {
                $(
                    YulProtectionFunction::$name => make_yule_def(stringify!($name), $def),
                )*
                }
            }
            #[allow(dead_code)]
            pub fn yule_deps(self) -> Vec<YulProtectionFunction> {
                match self {
                $(
                    YulProtectionFunction::$name => vec![$(YulProtectionFunction::$dep,)*],
                )*
                }
                
            }
        }
    }
}

fn make_yule_name(name: &str) -> String {
    format!("${}", name)
}

/// Helper to create definition of a Yule function.
fn make_yule_def(name: &str, body: &str) -> String {
    format!("function ${}{}", name, body)
}

protection_layer_functions! {
AbortNotProtected: "() {
    if iszero($IsProtected()) {
        $Abort2(6)
    }
}" dep IsProtected dep Abort2,
AbortProtected: "() {
    if $IsProtected() {
        $Abort2(7)
    }
}" dep IsProtected dep Abort2,
Abort2: "(code) {
    mstore(0, code)
    revert(24, 8) // TODO: store code as a string?
}",
// Protection flag functions
IsProtected: "() -> flag {
    flag := sload(0x0)
}",
Protect: "() {
    sstore(0x0, 1)
}",
Release: "() {
    sstore(0x0, 0)
}",
// Signer functions
SaveSigner: "() {
    sstore(0x1, caller())
}",
GetSigner: "() -> addr {
    addr := sload(0x1)
}",
DeleteSigner: "() {
    sstore(0x1, 0)
}",
// Protected contract functions
SaveProtectedContract: "(addr) {
    sstore(0x2, addr)
}",
GetProtectedContract: "() -> addr {
    addr := sload(0x2)
}",
DeleteProtectedContract: "() {
    sstore(0x2, 0)
}",
// Reentrancy flag functions
SetReentrancyFlag: "() {
    sstore(0x3, 1)
}",
ClearReentrancyFlag: "() {
    sstore(0x3, 0)
}",
IsReentrancyFlagSet: "() -> flag {
    flag := sload(0x3)
}",
// Hot potatoes AKA external storage functions
SizeOFH: "() -> size {
    size := sload(0x4)
}",
IncrementH: "() {
    sstore(0x4, add(sload(0x4), 1))
}",
DecrementH: "() {
    sstore(0x4, sub(sload(0x4), 1))
}",

// Transient functions
SizeOfT: "() -> size {
    size := sload(0x5)
}",
IncrementT: "() {
    sstore(0x5, add(sload(0x5), 1))
}",
DecrementT: "() {
    sstore(0x5, sub(sload(0x5), 1))
}",

NewResourceId: "() -> id {
    id := sload(0x6)
    sstore(0x6, add(id, 1))
}",

// TODO check Abort codes
// Validation function
Validate: "() -> flag {
    $AbortProtected()
    
    // check size of Hot and Transient
    if $SizeOFH() {
        $Abort2(1)
    }
    // check if reentrancy flag is set
    if $IsReentrancyFlagSet() {
        $Abort2(3)
    }
    flag := true
}" dep AbortProtected dep SizeOFH dep SizeOfT dep IsReentrancyFlagSet dep GetSigner dep GetProtectedContract dep Abort2,


ResIn: "(id) -> res {
    if iszero($IsProtected()) {
        $Abort2(6)
    }
    // assert type of resource we are getting as input
    // get resource
    // decrement size of Hot and Transient
    $DecrementH()
    $DecrementT()
    // delete resource from storage of Hot and Transient
    // return resource
    res := 0
}" dep IsProtected dep DecrementH dep DecrementT dep Abort2,

ResOut: "(res) -> id {
    if iszero($IsProtected()) {
        $Abort2(6)
    }
    // assert type of resource we are getting as input
    // increment size of Hot and Transient
    $IncrementH()
    $IncrementT()
    // store resource in storage of Hot and Transient
    let $t0 := $MakePtr(false, $GetSigner())
    // return id of resource
    id := 0
}" dep IsProtected dep IncrementH dep IncrementT dep Abort2,
}
