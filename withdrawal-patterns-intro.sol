// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Transfers are atomic - meaning all or nothing
// Cybersecurity is necessary in solidity against bad actors and accidental occurances

contract Withdrawls {
    address[] public funders;
    mapping(address => uint) public contributedAmount;
    address public owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function contribute() public payable {
        funders.push(msg.sender);
        contributedAmount[msg.sender] += msg.value;
    }

    function returnFunds() public onlyOwner returns(bool success){
        for(uint i = 0; i < funders.length; i++) {
            address payable funder = payable(funders[i]);
            uint amount = contributedAmount[funder];
            funder.transfer(amount);
        }
        return true;
    }

    // Exercise 01: write a function that will return funds to two investors, john and tatianna without using a for loop!
    // A for loop is unbound it could run out of gas before returning all the funds
    // What if owner doesn't want to return funds, a privileged user should initiate transfer

    function returnFunds02() public onlyOwner returns(bool success) {
       // tatianaAddress.transfer(contributedAmount);
       // johnAddress.transfer(contributedAmount);
        return true;
    }

    // In the above scenario tatiana or john could reject the transfer.
    // Even if titiana only rejects then johns transfer won't go through either
}

// How does a contract find out if another address is a contract?

contract Victim {
    function isItAContract() public view returns(bool) {
        // Check to see if there are greater than 0 bytes to see if there is a contract
        uint32 size;
        address a = msg.sender;
        // Access inline assembly of EVM with assembly{}
        assembly{
            // Retrieves the size of the code
            size := extcodesize(a)
        }
        return size > 0;
    }
}

// The below contract tricks the above contract into thinking it is an address by moving the address into the constructor
// If you call the address from the constructor there are no byte codes

contract Attacker {
    bool public trickedYou;
    //Inherhit victim contract
    Victim victim;
    constructor(address _v) {
        victim = Victim(_v);
        trickedYou = !victim.isItAContract();
    }
}

// So what do you do to avoid the above pitfalls?
// The answer is the withdrawl pattern