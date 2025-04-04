// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
 
contract Auction {
    uint public auctionEnds;
    uint public currentBid;
    address public currentBidder;
    uint public constant REWARD_AMOUNT = 100 ether;

    constructor() {
        auctionEnds = block.timestamp + 1 days;
    }

    function placeBid(uint amount) external payable {   
        // Check the bidder has paid the bid
        require(msg.value >= amount, "Insufficient funds to claim the reward");
        require(amount >= currentBid, "Bid is too low");

        currentBid = amount;
        currentBidder = msg.sender;
    }

    function claimReward(address winner) external payable {
        // Check if the auction has ended 
        require(block.timestamp > auctionEnds, "Auction is still ongoing");

        // Reward the winning bidder
        (bool success, ) = winner.call{value: REWARD_AMOUNT}("");
        require(success, "Rewarding user failed failed");
    }    
}