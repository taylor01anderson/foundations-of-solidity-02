// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// view vs. pure keywords
// view function ensure they will not modify the state (return values)
// pure function ensure that they will not read or modify the state (return calculations)

contract MyContract {
    uint value;

    // function getValue does not modify the state -- read only
    function getValue() external view returns(uint) {
        return value;
    }

    // function setValue mofifies the state
    function setValue(uint _value) external {
        value = _value;
    }

    // exercise 01: return 3 * 7
    function returnsTimesSeven() external pure returns(uint) {
        return 3*7;
    }

    // exercise 01: returns value + 3
    function returnValuePlusThree() external view returns(uint) {
        return value + 3;
    }
}

// exercise 01: create a function that returns 3 * 7
// create another function that returns state variable value + 3
