// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {ResourceDroppingV1} from "../src/ResourceDroppingV1.sol";
import {ProtectedContractV1} from "../src/ProtectedContractV1.sol";

contract ResourceDroppingV1Test is Test {
    address deployer = makeAddr("deployer");
    address user = makeAddr("user");

    ResourceDroppingV1 public resourceDroppingV1;
    ProtectedContractV1 public protectedContract;

    function setUp() public {
        resourceDroppingV1 = new ResourceDroppingV1();
        protectedContract = new ProtectedContractV1(
            address(resourceDroppingV1)
        );
    }

    function test_ExternalResource() public {
        vm.startPrank(user);
        resourceDroppingV1.allocate(18, 44);
        resourceDroppingV1.set(44, address(this));
        assert(resourceDroppingV1.read(address(this)) == 44);
    }

    function test_Remove() public {
        vm.startPrank(user);
        resourceDroppingV1.allocate(18, 44);
        resourceDroppingV1.remove(user);
    }

    function test_DropRes() public {
        vm.startPrank(user);
        protectedContract.wrapResource();
        assert(resourceDroppingV1.read(user) == 14);
    }

    function test_unwrapAndSink() public {
        vm.startPrank(user);
        protectedContract.wrapResource();
        assert(resourceDroppingV1.read(user) == 14);
        protectedContract.unwrap();
        vm.expectRevert();
        resourceDroppingV1.read(user);
    }
}
