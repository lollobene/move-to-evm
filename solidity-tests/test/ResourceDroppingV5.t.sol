// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {ResourceDroppingV5} from "../src/ResourceDroppingV5.sol";
import {ProtectedContractV4} from "../src/ProtectedContractV4.sol";

contract ResourceDroppingV5Test is Test {
    address deployer = makeAddr("deployer");
    address user = makeAddr("user");

    ResourceDroppingV5 public resourceDroppingV5;
    ProtectedContractV4 public protectedContract;

    function setUp() public {
        resourceDroppingV5 = new ResourceDroppingV5();
        protectedContract = new ProtectedContractV4(
            address(resourceDroppingV5)
        );
    }

    function test_ExternalResource() public {
        vm.prank(user);
        resourceDroppingV5.allocate(18, 44);
        resourceDroppingV5.set(44, address(this));
        assert(resourceDroppingV5.read(address(this)) == 44);
    }

    function test_Remove() public {
        vm.prank(user);
        resourceDroppingV5.allocate(18, 44);
        resourceDroppingV5.remove(user);
    }

    function test_DropRes() public {
        vm.startPrank(user);
        bytes memory cbData = protectedContract.protectExternalStoreEncoding();
        resourceDroppingV5.protect(address(protectedContract), cbData);
        assert(resourceDroppingV5.read(user) == 14);
    }

    function test_unwrapAndSink() public {
        vm.startPrank(user);
        // get 'protectExternalStore' function call encoding
        bytes memory cbData = protectedContract.protectExternalStoreEncoding();
        resourceDroppingV5.protect(address(protectedContract), cbData);
        assert(resourceDroppingV5.read(user) == 14);
        // get 'protectUnwrap' function call encoding
        cbData = protectedContract.protectUnwrapEncoding();
        resourceDroppingV5.protect(address(protectedContract), cbData);
        vm.expectRevert();
        resourceDroppingV5.read(user);
    }
}
