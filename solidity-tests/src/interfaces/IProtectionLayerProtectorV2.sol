// SPDX-License-Identifier: MIT

pragma solidity >=0.8.19;

import {IProtectedContractV2} from "./IProtectedContractV2.sol";

interface IProtectionLayerProtectorV2 {
    function protect(address, address, bytes memory) external returns (bool);

    function isProtected() external view returns (bool);
}
