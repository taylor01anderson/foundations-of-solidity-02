// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Libraries are similar tp contracts but are intended for reuse
// Libraries contain functions that other contract can call
// They can be called directly if they do not modify the state
// They cannot be destroyed and are stateless
// They cannot have state variables
// They cannot inherit any element
// They cannot be inherited
// Use they keybword library

library Search {
    // A loop to return the index value of an integer in an array
    function indexOf(uint[] storage self, uint value) public view returns(uint ) {
        for(uint i = 0; i <self.length; i++) {
            if(self[i] == value) {
                return i;
            }
        }
    }
}

contract Test {
    uint[] data;
    constructor() {
        for(uint i = 0; i < 4; i++) {
            data.push(i);
        }
    }

    function isValuePresnet(uint val) external view returns(uint) {
        uint value = val;
        uint index = Search.indexOf(data,value);
        return index; 
    }
}

// Using A for B
// This format can be used to attach al ibrary function of library A to a given type B
// Exercise 01: Rewrite the above library using teh A for B pattern

library Search2 {
    // A loop to return the index value of an integer in an array
    function indexOf(uint[] storage self, uint value) public view returns(uint ) {
        for(uint i = 0; i <self.length; i++) {
            if(self[i] == value) {
                return i;
            }
        }
    }
}

contract Test2 {
    using Search2 for uint[];
    uint[] data;
    constructor() {
        for(uint i = 1; i < 5; i++) {
            data.push(i);
        }
    }

    function isValuePresnet() external view returns(uint) {
        uint value = 4;
        uint index = data.indexOf(value);
        return index; 
    }
}