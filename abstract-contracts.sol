// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// An abstract contract contains at least one function without implementation
// Abstract contracts are used as based contraccts to be passed along to a derived contract
// The derived contracts will use abstract functions
// Use the kywork virtual in the base contract and override in the derived contract

// Base contract
contract X {
    // Since function y() has no implementation it should be marked as virtual
    function y() public pure virtual returns(string memory) {
    }
}

// Derived contract
contract Z is X {
    function y() public override pure returns(string memory) {
        return 'hello';
    }
}

// Base contract
contract Member {
    string name;
    uint age = 38;

    // Because setName has no body the contract is now abstract
    function setName() public view virtual returns(string memory) {
    }

    function returnAge() public view returns(uint) {
        return age;
    }
}

// Derived contract
contract Teacher is Member {
        function setName() public view override virtual returns(string memory) {
            return 'Gordon';
    }
}

// Exercise 01: Create an abstract contract that adds two numbers

contract baseCalculator {
    function add(uint x, uint y) public pure virtual returns(uint) {
    }
}

contract derivedCalculator is baseCalculator {
    function add(uint x, uint y) public pure override returns(uint) {
        return x + y;

    }
}