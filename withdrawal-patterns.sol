// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// When using the transfer method a party can reject or the transaction may not go through which reverts the code
// The send method returns a bool rather than returning the code

// example of transfering funds using the send method
contract Send {
    address payable owner;

    function sendViaSend (address payable _recipient) public onlyOwner returns(bool success) {
        success = _recipient.send(1 ether);
    }
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}

// Exercise 01: Write a function to claim refunds. Require the balance of the msg.sender to be greater than 0 and transfer
// balance to the current caller

contract ClaimRefunds {
    mapping(address => uint) public balance;
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function validateBalance() public {
        require(balance[owner] > 0);
        uint amount = balance[owner];
        payable (msg.sender).transfer(amount);
    }
}

// In the above contract by making our transactions one at a time we reduce danger to executions
// This is why withdrawl patterns are used

// Exercise 02: Since it is not safe to interact with more than one customer at a time write a function that takes
// in an amount and returns a bool signature
// require that the balance of the current caller is greater than or equal to the amount
// subract that amount
// transfer the amount over and return the trueness of the function

contract WithdrawlFunction {
    mapping (address => uint) public balance;

    function withdrawFunds(uint _amount) public returns(bool success) {
        require(balance[msg.sender] >= _amount);
        balance[msg.sender] -= _amount;
        payable (msg.sender).transfer(_amount);
        return true;
    }
}

