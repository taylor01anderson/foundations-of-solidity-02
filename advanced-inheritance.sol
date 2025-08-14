// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Inheritance is a way to extend functionality of a contract
// Solidity supports single and multiple inheritance
// Classes and contracts can inherit

contract A {
    uint innerVal = 100;

    function innerAddTen(uint _input) public pure returns(uint) {
        return _input + 10;
    }
}

contract B is A {
    function outerAddTen(uint _input) public pure returns(uint) {
        return A.innerAddTen(_input);
    }
    function getInnerVal() public view returns(uint) {
        return A.innerVal;
    }
}