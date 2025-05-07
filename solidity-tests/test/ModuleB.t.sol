// SPDX-License-Identifier: UNLICENSED
/*
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ModuleB} from "../src/ModuleB.sol";

contract CounterTest is Test {
    ModuleB public moduleB;

    function setUp() public {
        moduleB = new ModuleB();
    }

    function test_externalResource() public {
        moduleB.runGetRes();
        moduleB.runGiveBackRes();
        assert(moduleB.a().read(address(this)) == 44);
    }
}
*/