// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
 
contract Vault {
    mapping(address => uint) public balances;

    function deposit(uint amount) external payable {
        // Deposit the amount into the user's balance
        balances[msg.sender] += amount;
    }

    function withdraw() external {
        uint balance = balances[msg.sender];
        // Check the balance is greater than 0
        require(balance > 0, "No balance to withdraw");

        // Set the balance to zero 
        balances[msg.sender] = 0;

        // Transfer the amount to msg.sender
        (bool success, ) = msg.sender.call{value: balance}("");
        require(success, "Transfer failed");
    }
}