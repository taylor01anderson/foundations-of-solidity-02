// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Function overloading is whne you have multiple functions with the same name
// They must differ by the t ypes and of number of arguments
// You cannot overload functions that differ only in return type

contract functionOverloading {
    function x(bool lightSwitch) public {
    }

    function x(uint wallet) public {

    }
}

// Exercies 01: create two functions with the same name that return the sum of their arguments
// One function takes in two arguments and another takes in three
// Create two additional functions which can call each sum functions and return their various sums.

contract exercise01 {
    function sum(uint x, uint y, uint z) public pure returns(uint) {
        return x + y + z;
    }

    function sum(uint x, uint y) public pure returns(uint) {
        return x + y;
    }

    function callSum01(uint x, uint y, uint z) public pure returns(uint) {
        return sum(x,y,z);
    }

    function callSum02(uint x, uint y) public pure returns(uint) {
        return sum(x,y);
    }
}