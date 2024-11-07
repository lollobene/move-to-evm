// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {ResourceDroppingV2} from "../src/ResourceDroppingV2.sol";
import {ProtectedContractV2} from "../src/ProtectedContractV2.sol";

contract ResourceDroppingV2Test is Test {
    address deployer = makeAddr("deployer");
    address user = makeAddr("user");

    ResourceDroppingV2 public resourceDroppingV2;
    ProtectedContractV2 public protectedContract;

    function setUp() public {
        resourceDroppingV2 = new ResourceDroppingV2();
        protectedContract = new ProtectedContractV2(
            address(resourceDroppingV2)
        );
    }

    function test_ExternalResource() public {
        vm.startPrank(user);
        resourceDroppingV2.allocate(18, 44);
        resourceDroppingV2.set(44, address(this));
        assert(resourceDroppingV2.read(address(this)) == 44);
    }

    function test_Remove() public {
        vm.startPrank(user);
        resourceDroppingV2.allocate(18, 44);
        resourceDroppingV2.remove(user);
    }

    function test_DropRes() public {
        vm.startPrank(user);
        protectedContract.wrapResource();
        assert(resourceDroppingV2.read(user) == 14);
    }

    function test_unwrapAndSink() public {
        vm.startPrank(user);
        protectedContract.wrapResource();
        assert(resourceDroppingV2.read(user) == 14);
        protectedContract.unwrapResource();
        vm.expectRevert();
        resourceDroppingV2.read(user);
    }
}
