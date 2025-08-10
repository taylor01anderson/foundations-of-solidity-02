// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Function modifiers are used to modify the behavior of a function
// Function modifier are customizable 
// ex: public, payable, onlyOwner

contract Owner {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        // this underscore contiues the function if the requirement ahove passes
        _;
    }

    // ex 01: bring in function to verify price
    modifier verifyPrice(uint price) {
        // msg.value is the value being with with a message to the contract in wei
        require(msg.value >= price);
        _;
    }
}

contract Register is Owner {
    mapping (address => bool) registeredAddresses;
    uint price;

    constructor (uint initialPrice) { price = initialPrice; }

    // bring in minPrice function
    function register() public payable verifyPrice(price ) {
        registeredAddresses[msg.sender] = true;
    }

    function changePrice(uint _price) public onlyOwner {
        price = _price;
    }
}

// exercise 01: create a modifier function for register function that checks to see if the senders value is >= to price.