// SPDX-License-Identifier: MIT

pragma solidity >=0.8.19;

import {IProtectedContractV2} from "./interfaces/IProtectedContractV2.sol";
import {ResourceDroppingV3} from "./ResourceDroppingV3.sol";
import {ProtectionLayer} from "./ProtectionLayer.sol";

contract ProtectedContractV3 {
    struct Wrapper {
        uint256 droppedRes;
    }

    ResourceDroppingV3 public immutable resourceDropping;

    mapping(address => Wrapper) public droppedResources;

    constructor(address _resourceDropping) {
        resourceDropping = ResourceDroppingV3(_resourceDropping);
    }

    function protectExternalStore(address initiator) external returns (bool) {
        require(msg.sender == address(resourceDropping), "Unauthorized");
        uint256 ref = resourceDropping.dropRes();
        // added step to store resource externally
        resourceDropping.storeExternalResource(ref);
        droppedResources[initiator] = Wrapper(ref);
        return true;
    }

    function wrapResource() public {
        bool res = resourceDropping.protect(
            address(this),
            msg.sender,
            abi.encodeCall(this.protectExternalStore, msg.sender)
        );
        require(res, "External store protection failed");
    }

    function getWrapped(address owner) public view returns (Wrapper memory) {
        return droppedResources[owner];
    }
}
