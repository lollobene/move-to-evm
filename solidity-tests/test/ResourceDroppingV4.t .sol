// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {ResourceDroppingV4} from "../src/ResourceDroppingV4.sol";
import {ProtectedContractV2} from "../src/ProtectedContractV2.sol";

contract ResourceDroppingV4Test is Test {
    address deployer = makeAddr("deployer");
    address user = makeAddr("user");

    ResourceDroppingV4 public resourceDroppingV4;
    ProtectedContractV2 public protectedContract;

    function setUp() public {
        resourceDroppingV4 = new ResourceDroppingV4();
        protectedContract = new ProtectedContractV2(
            address(resourceDroppingV4)
        );
    }

    function test_ExternalResource() public {
        vm.startPrank(user);
        resourceDroppingV4.allocate(18, 44);
        resourceDroppingV4.set(44, address(this));
        assert(resourceDroppingV4.read(address(this)) == 44);
    }

    function test_Remove() public {
        vm.startPrank(user);
        resourceDroppingV4.allocate(18, 44);
        resourceDroppingV4.remove(user);
    }

    function test_DropRes() public {
        vm.startPrank(user);
        protectedContract.wrapResource();
        assert(resourceDroppingV4.read(user) == 14);
    }

    function test_unwrapAndSink() public {
        vm.startPrank(user);
        protectedContract.wrapResource();
        assert(resourceDroppingV4.read(user) == 14);
        protectedContract.unwrapResource();
        vm.expectRevert();
        resourceDroppingV4.read(user);
    }
}
