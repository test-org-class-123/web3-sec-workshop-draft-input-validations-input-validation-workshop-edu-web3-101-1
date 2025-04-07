# Input Validation Homework

## Assignment #1 – Auction Exercise

In this exercise, you’ll audit an Auction contract (see [here](./src/Auction.sol)) that lets users place bids. After 24 hours, the highest bidder should be able to claim the reward.

**Problem**: How could someone claim the reward even if they never placed a bid? Update the test file here to simulate an attacker stealing the reward.

 
## Assignment #2 – InvestmentManager Exercise

The InvestmentManager contract allows users to deposit and withdraw ETH. But something’s wrong — attackers are able to steal ETH from it.

**Problem**: Update the [withdrawFunds function](./src/InvestmentManager.sol) to prevent users from withdrawing funds they shouldn’t be able to.

 
## Assignment #3 – Vault Exercise

In this final exercise, the Vault contract lets users deposit ETH then withdraw Eth after one day, with a 1 ETH bonus.

**Problem**: Update the [Vault test](./test/Vault.t.sol) to simulate a user withdrawing more than they actually deposited.

 