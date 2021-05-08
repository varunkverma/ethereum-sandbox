pragma solidity ^0.8.1;

import "./09_owned.sol";

// contract Owned {
//     address owner;
    
//     constructor() {
//         owner = msg.sender;
//     }
    
//     modifier onlyOwner(){
//          require(msg.sender == owner, "You are not authorized.");
//         _;
//     }
// }

contract InheritenceModifierExample is Owned {
    
    mapping(address => uint) public tokenBalance;
    
    uint tokenPrice = 1 ether;
    
    constructor() {
        tokenBalance[owner]=100;
    }
    
    function createNewToken() public onlyOwner{
        tokenBalance[owner]++;
    }
    
    function burnToken() public onlyOwner{
        tokenBalance[owner]--;
    }
    
    function purchaseToken() public payable {
        // checking if owner has enough tokens to sell
        require((tokenBalance[owner] * tokenPrice / msg.value) > 0, "Not enough tokens available");
        tokenBalance[owner] -= (msg.value / tokenPrice);
        tokenBalance[msg.sender] += (msg.value / tokenPrice);
    }
    
    function sendToken(address toAddress, uint amount) public {
        // checking if sender has enough tokens/amount
        require(tokenBalance[msg.sender] >= amount, "You don't have enough tokens");
        // asserting for value wrap around when receiver receives tokens
        assert((tokenBalance[toAddress] + amount) >= tokenBalance[toAddress]);
        // asserting for value wrap around when sender sends token
        assert((tokenBalance[msg.sender] - amount) <= tokenBalance[msg.sender]);
        
        tokenBalance[toAddress] += amount;
        tokenBalance[msg.sender] -=amount;
    }
} 

// contract InheritenceModifierExample{
    
//     mapping(address => uint) public tokenBalance;
    
//     address owner;
    
//     uint tokenPrice = 1 ether;
    
//     constructor() {
//         owner = msg.sender;
//         tokenBalance[owner]=100;
//     }
    
//     function createNewToken() public {
//         require(msg.sender == owner, "You are not authorized to create a new token.");
//         tokenBalance[owner]++;
//     }
    
//     function burnToken() public {
//         require(msg.sender == owner, "You are not authorized to burn token.");
//         tokenBalance[owner]--;
//     }
    
//     function purchaseToken() public payable {
//         // checking if owner has enough tokens to sell
//         require((tokenBalance[owner] * tokenPrice / msg.value) > 0, "Not enough tokens available");
//         tokenBalance[owner] -= (msg.value / tokenPrice);
//         tokenBalance[msg.sender] += (msg.value / tokenPrice);
//     }
    
//     function sendToken(address toAddress, uint amount) public {
//         // checking if sender has enough tokens/amount
//         require(tokenBalance[msg.sender] >= amount, "You don't have enough tokens");
//         // asserting for value wrap around when receiver receives tokens
//         assert((tokenBalance[toAddress] + amount) >= tokenBalance[toAddress]);
//         // asserting for value wrap around when sender sends token
//         assert((tokenBalance[msg.sender] - amount) <= tokenBalance[msg.sender]);
        
//         tokenBalance[toAddress] += amount;
//         tokenBalance[msg.sender] -=amount;
//     }
// } 
