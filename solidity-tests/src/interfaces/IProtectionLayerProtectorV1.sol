// SPDX-License-Identifier: MIT

pragma solidity >=0.8.19;

import {IProtectedContractV1} from "./IProtectedContractV1.sol";

interface IProtectionLayerProtectorV1 {
    function protect(IProtectedContractV1, address) external returns (bool);

    function isProtected() external view returns (bool);
}
