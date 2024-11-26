// SPDX-License-Identifier: MIT

pragma solidity >=0.8.19;

import {IProtectedContractV2} from "./interfaces/IProtectedContractV2.sol";
import {ResourceDroppingV5} from "./ResourceDroppingV5.sol";
import {ProtectionLayer} from "./ProtectionLayer.sol";

contract ProtectedContractV4 {
    struct Wrapper {
        uint256 droppedRes;
    }

    ResourceDroppingV5 public immutable resourceDropping;

    mapping(address => Wrapper) public droppedResources;

    constructor(address _resourceDropping) {
        resourceDropping = ResourceDroppingV5(_resourceDropping);
    }

    function protectExternalStore(address signer) external returns (bool) {
        require(msg.sender == address(resourceDropping), "Unauthorized");
        uint256 ref = resourceDropping.dropRes();
        // added step to store resource externally
        resourceDropping.storeExternalResource(ref);
        droppedResources[signer] = Wrapper(ref);
        return true;
    }

    function protectUnwrap(address signer) external returns (bool) {
        require(msg.sender == address(resourceDropping), "Unauthorized");
        Wrapper memory wrapped = droppedResources[signer];
        // added step to unstore external resource
        delete droppedResources[signer];
        resourceDropping.unstoreExternalResource(wrapped.droppedRes);
        resourceDropping.sink(wrapped.droppedRes);
        return true;
    }

    function protectExternalStoreEncoding() public view returns (bytes memory) {
        return abi.encodeCall(this.protectExternalStore, msg.sender);
    }

    function protectUnwrapEncoding() public view returns (bytes memory) {
        return abi.encodeCall(this.protectUnwrap, msg.sender);
    }

    function getWrapped(address owner) public view returns (Wrapper memory) {
        return droppedResources[owner];
    }
}
