// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Auction} from "../src/Auction.sol";

contract AuctionTest is Test {
    Auction public auction;
    address public victim = address(0x789);
    address public attacker = address(0x123);

    function setUp() public {
        auction = new Auction(); 
        vm.deal(address(auction), 100 ether);
        vm.deal(address(victim), 1);

        vm.startPrank(victim);
        address(auction).call{value: 1}(abi.encodeWithSignature("placeBid(uint256)", 1));
        vm.warp(vm.getBlockTimestamp() + 86401);
    }

    function test_StealReward() public {
        /* 
            Description: 
            
            In this exercise, our goal is to steal the reward from the Auction contract as the attacker contract.
            
            Goal: 
            
            The exercise is complete if the attacker won the 100 ether making a bid of 1 wei.

            Tips:

            - To call the Auction contract, you can write the following code:
                - auction.nameOfFunction(arg1);
 
        */ 

        // This impersonates the attacker contract
        vm.startPrank(attacker);
        
        // EXERCISE: Add solution below
        
        assertEq(attacker.balance, 100 ether);
        assertEq(victim.balance, 0);
        assertEq(address(auction).balance, 1);

    } 
}
