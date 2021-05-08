// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract MoneyTransfer{
    
    
    uint public balanceReceived;
    
    // Send money to smart contract
    function receiveMoney() public payable{
        // msg.value is the value in wei that was transaferred in the transaction  
        balanceReceived+=msg.value;
    }
    
    function getBalance() public view returns(uint){
        return address(this).balance;
    } 
    
    function withdrawMoney() public{
        // sending money back to sender
        address payable to =payable(msg.sender);  
        to.transfer(this.getBalance());
    }
    
    function withdrawMoneyToAccount(address payable toAccount) public{
        toAccount.transfer(this.getBalance());
    }
}