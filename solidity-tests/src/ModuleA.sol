// SPDX-License-Identifier: MIT
/*
pragma solidity >=0.8.19;

import {ProtectionLayer} from "./ProtectionLayer.sol";

contract ModuleA is ProtectionLayer {
    mapping(address => A) state;

    struct A {
        uint256 a;
    }

    // * This is a reference to a resource, so we should not be able to drop it.

    // struct RefA {
    //     address addr;
    // }

    function resourceOut(uint256 a) external resOut(0) returns (A memory) {
        return A(a);
    }

    function resourceIn(A calldata res) external resIn(0) {
        state[signer] = res;
    }

    function storeExternal(A calldata res) external storeExt(0) {}

    function unstoreExternal(A calldata res) external unstoreExt(0) {
        state[signer] = res;
    }

    function read(address acc) public view returns (uint256) {
        // this is like a borrow_global
        return state[acc].a;
    }

    //  * This really does not makes sense, because Move would not allow
    //  * to drop the resource 'res', we should use a reference to 'res' instead.
    //  * Here we are just testing the ProtectionLayer.
    // function read(A memory ref) public pure returns (uint256) {
    //     return ref.a;
    // }

    // function get(address acc) private returns (A memory) {
    //     // this is like a move_from
    //     A memory s = state[acc];
    //     delete state[acc];
    //     return s;
    // }

    // function writeInternal(A calldata s) private {
    //     state[msg.sender] = s;
    // }

    // function createInternal(uint256 a) private pure returns (A memory) {
    //     return A(a);
    // }
}
*/