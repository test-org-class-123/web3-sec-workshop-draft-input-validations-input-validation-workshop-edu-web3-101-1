// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Vault} from "../src/Vault.sol";

contract VaultTest is Test {
    Vault public vault;
    address public victim = address(0x789);
    address public attacker = address(0x123);

    function setUp() public {
        vault = new Vault(); 
        vm.deal(address(vault), 1000 ether);
    }

    function test_StealEth() public {
        /* 
            Description: 
            
            In this exercise, our goal is to steal the Eth stored in the Vault contract as the attacker contract.
            
            Goal: 
            
            The exercise is complete if the attacker has the 1,000 ether. 

            Tips:

            - To call the Vault contract, you can write the following code:
                - vault.nameOfFunction(arg1);
 
        */ 

        // This impersonates the attacker contract
        vm.startPrank(attacker);
        
        // EXERCISE: Add solution below

        assertEq(attacker.balance, 1000 ether);
        assertEq(victim.balance, 0);
        assertEq(address(vault).balance, 0);
    } 
}
