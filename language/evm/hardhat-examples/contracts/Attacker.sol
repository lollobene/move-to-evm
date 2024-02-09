// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IVulnerableContract {
    function reentrant_function() external;
}

contract AttackerV1 {

    constructor ( ) {}

    function attack() public {
        IVulnerableContract(msg.sender).reentrant_function();
    }
}