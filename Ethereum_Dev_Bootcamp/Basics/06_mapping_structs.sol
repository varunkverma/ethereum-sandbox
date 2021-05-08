// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract MappingStruct {
    struct Payment {
        uint256 amount;
        uint256 timestamps;
    }

    struct Balance {
        uint256 totalBalance;
        uint256 numberOfPayments;
        mapping(uint256 => Payment) payments;
    }

    mapping(address => Balance) public contractAccountToAddressMap;

    function getContractAccountBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function sendMoneyToContractAccount() public payable {
        contractAccountToAddressMap[msg.sender].totalBalance += msg.value;

        Payment memory payment = Payment(msg.value, block.timestamp);

        contractAccountToAddressMap[msg.sender].payments[
            contractAccountToAddressMap[msg.sender].numberOfPayments
        ] = payment;

        contractAccountToAddressMap[msg.sender].numberOfPayments++;
    }

    function withrawMoney(address payable toAddress, uint256 amount) public {
        require(
            amount <= contractAccountToAddressMap[msg.sender].totalBalance,
            "Not enough funds, choose a lower amount."
        );
        contractAccountToAddressMap[msg.sender].totalBalance -= amount;
        toAddress.transfer(amount);
    }

    function withdrawAllMoneyFromContractAccount(address payable toAddress)
        public
    {
        uint256 balanceStoredToAddress =
            contractAccountToAddressMap[msg.sender].totalBalance;
        contractAccountToAddressMap[msg.sender].totalBalance = 0;
        toAddress.transfer(balanceStoredToAddress);
    }
}
