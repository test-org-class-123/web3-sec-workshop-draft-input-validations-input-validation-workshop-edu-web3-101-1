// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
 
contract InvestmentManager {
    struct Investment {
        address investor;
        uint balance;
    }
    mapping(address => Investment) public investments;

    function deposit() external payable {
        // Deposit the amount into the investment
        investments[msg.sender].balance += msg.value;
    }

    // EXERCISE: Add solution inside this function.
    function withdrawFunds(uint amountToWithdraw) external {
        Investment storage investment = investments[msg.sender];

        // Set balance to 0.
        investment.balance = 0;

        // Transfer the amount to the investor 
        (bool success, ) = msg.sender.call{value: amountToWithdraw}("");
        require(success, "Transfer failed");
    }
}