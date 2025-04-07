// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {InvestmentManager} from "../src/InvestmentManager.sol";

contract InvestmentManagerTest is Test {
    InvestmentManager public investmentManager;
    address public victim = address(0x789);
    address public attacker = address(0x123);

    function setUp() public {
        investmentManager = new InvestmentManager(); 
        vm.deal(address(victim), 777 ether);
        vm.prank(victim);
        investmentManager.deposit{value: 777 ether}();
    }

    function test_StealInvestment() public {
        /* 
            Description: In this exercise, our goal is to fix the InvestmentManager contract so that the 
            attacker can't withdraw more funds than they deposited.
            
            Goal: Apply the proper fix to the InvestmentManager contract. You are not allowed to modify the test.
            The exercise is complete if the attacker has 0 ether. 

            Tips: To call the Vault contract, you can write the following code: vault.nameOfFunction(arg1);
        */ 

        // This impersonates the attacker contract
        vm.startPrank(attacker);

        vm.expectRevert();
        investmentManager.withdrawFunds(777 ether);

        assertEq(attacker.balance, 0 ether);
        assertEq(address(investmentManager).balance, 777 ether);
    } 
}
