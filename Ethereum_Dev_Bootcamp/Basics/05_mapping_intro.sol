// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract SimpleMappingIntro {
    // maps are used as a work-around,
    mapping(uint256 => bool) public myMapping;

    function setValue(uint256 key) public {
        myMapping[key] = true;
    }

    mapping(address => bool) public myAddressMapping;

    function setMyAddressMapping() public {
        myAddressMapping[msg.sender] = true;
    }
}
