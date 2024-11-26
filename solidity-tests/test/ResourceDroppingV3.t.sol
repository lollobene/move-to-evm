// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {ResourceDroppingV3} from "../src/ResourceDroppingV3.sol";
import {ProtectedContractV2} from "../src/ProtectedContractV2.sol";

contract ResourceDroppingV3Test is Test {
    address deployer = makeAddr("deployer");
    address user = makeAddr("user");

    ResourceDroppingV3 public resourceDroppingV3;
    ProtectedContractV2 public protectedContract;

    function setUp() public {
        resourceDroppingV3 = new ResourceDroppingV3();
        protectedContract = new ProtectedContractV2(
            address(resourceDroppingV3)
        );
    }

    function test_ExternalResource() public {
        vm.startPrank(user);
        resourceDroppingV3.allocate(18, 44);
        resourceDroppingV3.set(44, address(this));
        assert(resourceDroppingV3.read(address(this)) == 44);
    }

    function test_Remove() public {
        vm.startPrank(user);
        resourceDroppingV3.allocate(18, 44);
        resourceDroppingV3.remove(user);
    }

    function test_DropRes() public {
        vm.startPrank(user);
        protectedContract.wrapResource();
        assert(resourceDroppingV3.read(user) == 14);
    }

    function test_unwrapAndSink() public {
        vm.startPrank(user);
        protectedContract.wrapResource();
        assert(resourceDroppingV3.read(user) == 14);
        protectedContract.unwrapResource();
        vm.expectRevert();
        resourceDroppingV3.read(user);
    }
}
