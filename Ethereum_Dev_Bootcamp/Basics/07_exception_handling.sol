// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract ExceptionExample {
    mapping(address => uint64) public balanceReceived;
    
    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + uint64(msg.value) >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender]+=uint64(msg.value);
    }
    
    function withdrawMoney(address payable toAddress, uint64 amount) public {
        require(amount<=balanceReceived[msg.sender],"You don't have enough money");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - amount);
        balanceReceived[msg.sender]-=amount;
        toAddress.transfer(amount);

    }
}
