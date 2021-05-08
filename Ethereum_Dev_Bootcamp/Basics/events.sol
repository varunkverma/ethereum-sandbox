// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract EventExample {
    mapping(address => uint256) public tokenBalance;

    event TokensSent(address fromAddress, address toAddress, uint256 amount);

    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address toAddress, uint256 amount)
        public
        returns (bool)
    {
        require(tokenBalance[msg.sender] >= amount, "Not enough tokens");

        assert(tokenBalance[toAddress] + amount >= tokenBalance[toAddress]);

        assert(tokenBalance[msg.sender] - amount <= tokenBalance[msg.sender]);

        tokenBalance[msg.sender] -= amount;
        tokenBalance[toAddress] += amount;

        emit TokensSent(msg.sender, toAddress, amount);

        return true;
    }
}
