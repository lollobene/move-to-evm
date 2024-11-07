// SPDX-License-Identifier: MIT

pragma solidity >=0.8.19;

import {IProtectedContractV2} from "./IProtectedContractV2.sol";

interface IProtectionLayerProtectorV3 {
    function protect(address, bytes memory) external returns (bool);

    function isProtected() external view returns (bool);
}
