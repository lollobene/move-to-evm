// SPDX-License-Identifier: MIT

pragma solidity >=0.8.19;

interface IProtectedContractV1 {
    function onProtect(address initiator) external returns (bool);
    function onProtect2(address initiator) external returns (bool);
}
