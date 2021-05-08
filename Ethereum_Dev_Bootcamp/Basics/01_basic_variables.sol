// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract WorkingWithBasicVariables {
    
    uint256 public myUInt256 ;
    
    function setMyUInt256(uint256 val) public{
        myUInt256=val;
    }
    
    bool public myBool;
    
    function setMyBool(bool val) public {
        myBool=val;
    }
    
    uint8 public myUInt8;
    
    function incrementMyUInt8() public{
        myUInt8++;
    }
    function decrementMyUInt8() public{
        myUInt8--;
    }
    
    
    address public myAddress;
    
    function setMyAddress(address val) public {
        myAddress=val;
    }
    function getBalanceOfMyAccount() public view returns(uint){
        return myAddress.balance;
    }
    
    string public myString;
    
    function setMyString(string memory val) public{
        myString=val;
    }
}
