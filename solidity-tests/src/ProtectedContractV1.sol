// SPDX-License-Identifier: MIT

pragma solidity >=0.8.19;

import {IProtectedContractV1} from "./interfaces/IProtectedContractV1.sol";
import {ResourceDroppingV1} from "./ResourceDroppingV1.sol";
import {ProtectionLayer} from "./ProtectionLayer.sol";

contract ProtectedContractV1 is IProtectedContractV1 {
    struct Wrapper {
        uint256 droppedRes;
    }

    ResourceDroppingV1 public immutable resourceDropping;

    mapping(address => Wrapper) public droppedResources;

    constructor(address _resourceDropping) {
        resourceDropping = ResourceDroppingV1(_resourceDropping);
    }

    function onProtect(address initiator) external override returns (bool) {
        require(msg.sender == address(resourceDropping), "Unauthorized");
        uint256 ref = resourceDropping.dropRes();
        // added step to store resource externally
        resourceDropping.storeExternalResource(ref);
        droppedResources[initiator] = Wrapper(ref);
        return true;
    }

    function onProtect2(address initiator) external returns (bool) {
        require(msg.sender == address(resourceDropping), "Unauthorized");
        Wrapper memory wrapped = droppedResources[initiator];
        // added step to unstore external resource
        delete droppedResources[initiator];
        resourceDropping.unstoreExternalResource(wrapped.droppedRes);
        resourceDropping.sink(wrapped.droppedRes);
        return true;
    }

    function wrapResource() public {
        bool res = resourceDropping.protect(this, msg.sender);
        require(res, "Protection failed");
    }

    function getWrapped(address owner) public view returns (Wrapper memory) {
        return droppedResources[owner];
    }

    function unwrap() public {
        bool res = resourceDropping.protect2(this, msg.sender);
        require(res, "Protection failed");
    }
}
