// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Ether is currency for the ethereum blockchain

contract learnEtherUnits {
    function test() public pure {
        // assert is a function that tests if a statement is true
        // wei is the smallest demonination of ether, 10^18 wei - 1 eth
        assert(1000000000000000000 wei == 1 ether);

        assert(1 wei == 1);

        // 1 ether == 1e18
        assert(1 ether == 1e18);

        // How many weis is 2 eths?
        assert(2 ether == 2000000000000000000);

        // Exercise 01: create assertions for equivalencies for 
        // minutes to seconds
        // hours to minutes
        // days to weeks

        assert(1 minutes == 60 seconds);
        assert(24 hours == 1440 minutes);
        assert(7 days == 1 weeks);
    }
}