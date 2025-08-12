// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// By default a contract state is read-only unless specified as public
// Modifiers allow you to restrict who can modify the contracts state or call a contract function
// Examples include:
// -onlyBy: only the mentioned caller can call the function
// -onlyAfter: a function only able to be called after a certain time period
// -costs: the function can only be called if a certain value is provided

contract RestrictedAccess {
    address public owner = msg.sender;
    uint public creationTime = block.timestamp;

    // This modifier restircts access to the message sender
    modifier onlyBy(address _account) {
        require (msg.sender == _account, 'Sender not authorized');
        _;
    }

    // This function restricts access that can only be run three weeks after the creation of the contract
    modifier onlyAfter(uint _time) {
        require(block.timestamp >= _time, 'Function called too early');
        _;
    }

    // This function will change the owners address
    // To restrict access use an onlyBy modifier
    function changeOwnerAddress(address _newOwner) onlyAfter(creationTime + 3 weeks) onlyBy(owner) public {
        owner = _newOwner;
    }

    // Write a function that can disown the current owner
    // Require only the owner can do this
    function disown() onlyBy(owner) public {
        delete owner;
    }

    // Exercise 01: Create a cost modifier that is required to change the owner
    modifier minValue(uint _amount) {
        require(msg.value >= _amount, 'Insufficient value');
        _;
    }

    function changeOwnerCost(address _newOwner) minValue(200 ether) payable public {
        _newOwner = owner; 
    }
}