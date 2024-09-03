// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.19;

import {ProtectionLayer} from "./ProtectionLayer.sol";

contract ModuleA is ProtectionLayer {

    mapping(address => A) public state;

    struct A {
        uint256 a;
    }

    function resourceOut(uint256 a) external resOut(0) returns (A memory) {
        return A(a);
    }

    function resourceIn(A calldata res) external resIn(0) {
        state[msg.sender] = res;
    }

    function storeExternal(A calldata res) external storeExt(0) {}

    function unstoreExternal(A calldata res) external unstoreExt(0) {
        state[msg.sender] = res;
    }

    /*
    function read(address acc) public view returns (uint256) {
        return state[acc].a;
    }

    function get(address acc) private returns (A memory) {
        A memory s = state[acc];
        state[acc] = S(0);
        return s;
    }

    function writeInternal(A calldata s) private {
        state[msg.sender] = s;
    }

    function createInternal(uint256 a) private pure returns (A memory) {
        return A(a);
    }
    */
}