// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Solidty has functions that help with error handling
// assert(bool condition) - If the condition is not met, the code will revert. Used for internal test and debugging
// require(bool condition) - If condition is not method. the code will revert. Used for errors in inputs or external compoments
// require(bool condition, string memory message) - Provides an option for a custom message
// revert() - This method aborts the execution and reverts chanegs to the state
// revert(string memory reason) = This method aborts the execution and reverts changes to the state with a message

contract LearnErrorHandling {
    bool public sunny = true;
    bool public umbrella = false;
    uint finalCalc = 0;

    // function to run calculations if it is sunny to learn require 
    function solarcalc() public {
        require(sunny, "It is not Sunny");
        finalCalc += 3;
        assert(finalCalc != 6);

    }

    // function to test if finalCalc = 6. Move the body to above function to prevent calculation
    function internalTestUnits() public view {
        assert(finalCalc != 6);
    }

    // Change the weather
    function weatherChanger() public {
        sunny = !sunny;
    }

    // get final calc
    function getCalc() public view returns (uint) {
        return finalCalc;
    }

    function bringUmbrella() public {
        if (!sunny) {
            umbrella = true;
        } else {
        revert("No need to bring Umbrella");
        }
    }
}

// Exercise 01; Erro handling

contract Vendor {
    address seller;

    // Require that only the seller can sell
    modifier onlySeller() {
        require(msg.sender == seller);
        _;
    }

    // function to transfer wondership
    function becomeSeller() public {
        seller = msg.sender;
    }

    // Require minimum ether amount 
    function sell(uint amount) payable public onlySeller {
        if(amount > msg.value) {
            revert("There is not enough ether");
        }
    }
}
