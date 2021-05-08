// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract FunctionsExample {
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    function destroySmartContract() public {
        require(payable(msg.sender) == owner, "You aren't the owner");
        selfdestruct(owner);
    }

    function convertWeiToEther(uint256 amountInWei)
        public
        pure
        returns (uint256)
    {
        return amountInWei / 1 ether;
    }

    mapping(address => uint256) public balanceReceived;

    function receivedMoney() public payable {
        assert(
            balanceReceived[msg.sender] + msg.value >=
                balanceReceived[msg.sender]
        );
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable toAddress, uint256 amount) public {
        require(amount <= balanceReceived[msg.sender], "Not enough funds.");
        assert(
            balanceReceived[msg.sender] >= balanceReceived[msg.sender] - amount
        );
        balanceReceived[msg.sender] -= amount;
        toAddress.transfer(amount);
    }

    // fallabck function
    fallback() external payable {
        receivedMoney();
    }

    // fallback() external {}
}
