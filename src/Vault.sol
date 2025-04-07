// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
 
contract Vault {
    mapping(address => uint) public balances;
    mapping(address => uint) public canWithdrawFunds;

    function deposit(uint amount) external payable {
        // Deposit the amount into the user's balance
        balances[msg.sender] += amount;
        // Each time a user deposits funds, we require the depositor to wait 1 day before they can withdraw.
        canWithdrawFunds[msg.sender] = block.timestamp + 1 days;
    }

    function withdraw() external {
        uint balance = balances[msg.sender];
        // Check the balance is greater than 0
        require(balance > 0, "No balance to withdraw");

        // Users must wait 1 day before they can withdraw their funds.
        require(block.timestamp >= canWithdrawFunds[msg.sender], "Cannot withdraw yet");

        // Set the balance to zero 
        balances[msg.sender] = 0;        

        uint bonus = 1 ether;

        // Transfer the amount to msg.sender
        (bool success, ) = msg.sender.call{value: balance + bonus}("");
        require(success, "Transfer failed");
    }
}