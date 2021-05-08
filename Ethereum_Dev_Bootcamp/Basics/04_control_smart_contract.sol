// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract ControlSmartContrats{
    
    address ownerAddress;
    
    bool public isSmartContractPaused;
    
    constructor() {
        ownerAddress = msg.sender;
    }
    
    function setIsSmartContractPaused(bool val) public {
        require(ownerAddress == msg.sender, "You are not authorised to pause this");
        isSmartContractPaused=val;
    }
    
    function sendMoney() public payable{
        
    }
    
    // withdraw all money from smart contract account
    function withdrawAllMoney(address payable accountTo) public{
        require(msg.sender == ownerAddress, "You are not the owner");
        require(!isSmartContractPaused, "Contract is paused");
        accountTo.transfer(address(this).balance);
    }
    
    // destroy smart contract and send remaining fund to an address
    function destroySmartContract(address payable toAccount) public {
        require(ownerAddress == msg.sender, "You are not authorised to destroy this smart contract");
        selfdestruct(toAccount);
    }
    
}