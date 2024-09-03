// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.19;

import { ModuleA } from "./ModuleA.sol";

contract ModuleB {

    mapping (address => B) state;

    struct B {
        ModuleA.A s; // reference to A.S
    }

    ModuleA public a;

    constructor() {
        a = new ModuleA();
    }

    function runGetRes() public {
        a.protect(msg.sender, abi.encodeCall(this.getResource, ()));
    }

    function runGiveBackRes() public {
        a.protect(msg.sender, abi.encodeCall(this.giveBackRes, ()));
    }

    function getResource() public {
        // get resource from S
        ModuleA.A memory res = a.resourceOut(44);
        // wrap S into struct B
        B memory b = B(res);
        // move_to B to sender
        state[msg.sender] = b;
        a.storeExternal(res);
    }

    function giveBackRes() public {
        // move_from B from sender
        B memory b = state[msg.sender];
        delete state[msg.sender];
        a.unstoreExternal(b.s);
        // give back resource
        a.resourceIn(b.s);

        assert(a.read(msg.sender) == 44);
    }

}