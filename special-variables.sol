// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// special variables or global variables are globally available and provide information about
// examples are msg.sender (current call)
// msg.value (uint) number of wei sent with teh message
// block.timestamp: current block timestamp as seconds since the last block.number (uint) and current block number

contract LedgerBalance {

    // create a map of wallets with amounts
    // set up a function that can update the amount of the person can call the contract
    mapping(address => uint) balance;

    // create a function that updates the balance
    function updatesBalance(uint newBalance) public {
        // access address with msg.sender
        // update balance with function parameter
        balance[msg.sender] = newBalance;
    }
}

// exercise 01: create a new contract that updates the balance of the above contract to 30

contract Updated {
    function updatesBalance() public {
        // take above contract and set it to a new variable then set that to a new instance of the contract
        LedgerBalance ledgerBalance = new LedgerBalance();
        ledgerBalance.updatesBalance(30);
    }
}

// Learn other global variables
// block.difficulty is the diffuclty of the current block

contract SimpleStorage {
    uint storedData;

    function set() public{
        // store block difficulty
        // storedData = block.difficulty;

        // store the timestamp
        // storedData = block.timestamp;

        //store the block number
        storedData = block.number;
    }

    function get() public view returns (uint) {
        return storedData;
    }
}