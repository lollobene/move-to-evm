// SPDX-License-Identifier: MIT
/*
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
        a.protect(msg.sender, abi.encodeCall(this.getResource, (msg.sender)));
    }

    function runGiveBackRes() public {
        a.protect(msg.sender, abi.encodeCall(this.giveBackRes, (msg.sender)));
    }

    function getResource(address signer) public {
        // get resource from S
        ModuleA.A memory res = a.resourceOut(44);
        // wrap S into struct B
        B memory b = B(res);
        // move_to B to sender
        state[signer] = b;
        a.storeExternal(res);
    }

    function giveBackRes(address signer) public {
        // move_from B from sender
        B memory b = state[signer];
        delete state[signer];
        a.unstoreExternal(b.s);
        // give back resource
        a.resourceIn(b.s);
    }

}
*/