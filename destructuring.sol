// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// solidity functions can return multiple variables of different types
// 

contract Destructuringfunctions {
    // declare multiple variables
    uint public changeValue;
    string public tom = 'Hello';

    // return multiple variables by wrapping them in parentheses and commas
    function f() public pure returns (uint, bool, string memory) {
        return (3, true, 'Bye');
    }

    // destructure using commas
    function g() public {
        (changeValue,,) = f();
    }

    // destructure using commas with multiple variables
    function h() public {
        (changeValue,,tom) = f();
    }
}