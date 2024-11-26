// SPDX-License-Identifier: MIT

pragma solidity >=0.8.11;

contract MappingTest {
    mapping(uint256 => bytes4) typeHashes;
    mapping(uint256 => bytes4) typeHashes2;

    function set(uint256 key, bytes4 value) public {
        typeHashes[key] = value;
        typeHashes2[key] = value;
    }

    function get(uint256 key) public view returns (bytes4) {
        return typeHashes[key];
    }
}
