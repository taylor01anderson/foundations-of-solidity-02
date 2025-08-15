// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Interfaces are similar to abstract contracts
// They are created using the keyboard interface
// They cannot have functions with implementation
// They can only be external
// They cannot have a constructor
// They cannot have state variables
// They can use emums, structs, and be accessed using interface dot notation

contract Counter {
    uint public count;

    function increment() external {
        count ++;
    }
}

// We can interact with this contract without copy and pasting by suing an interface

interface ICounter {
    function count() external view returns(uint);
    function increment() external;
}

contract MyContract {
    function incrementCounter(address _counter) external pure {
        ICounter(_counter).increment;
    }
    function getCount(address _counter) external view returns(uint) {
        return ICounter(_counter).count();
    }
}
