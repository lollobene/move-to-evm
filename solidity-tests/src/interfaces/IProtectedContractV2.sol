// SPDX-License-Identifier: MIT

pragma solidity >=0.8.19;

interface IProtectedContractV2 {
    function onProtect(address initiator) external returns (bool);
}
