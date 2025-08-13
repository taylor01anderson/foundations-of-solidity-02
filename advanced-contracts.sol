// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Internal functions/variables can only be used internally or by derived contracts
// External functions are meant to be called by other contracts, can be baclled within a contract with this.function()
// Private functions/ variables can only be used internally and not by derived contracts

contract A {
    uint public data = 10;

    // external function
    function x() external pure returns (uint) {
        uint newData = 25;
        return newData;
    }

    // public function
    function l() public view returns (uint) {
        uint newData = data -3;
        return newData;
    }

    // public function
    function y() public view returns (uint) {
        return data;
    }
}

contract B {
    // Set instance of contract A to variable a
    A a = new A();

    function f() public view returns (uint) {
        return a.l();
    }
}

contract C {
    uint private data;
    uint public info;

    constructor() {
        info = 10;
    }

    function increment (uint _a) private pure returns(uint) {
        return _a ++;
    }

    function updateData(uint _a) public {
        data = _a;
    }

    function getData() public view returns(uint) {
        return data;
    }

    function compute(uint _a, uint _b) internal pure returns(uint) {
        return _a + _b;
    }
}

contract D {
    C c = new C();

    function readInfo() public view returns (uint) {
        return c.info();
    }
}

contract E is C {
    uint private result;
    C private c;

    constructor() {
        c = new C();
    }

    function getCoputedresult() public {
        result = compute(23, 5);
    }

    function getResult() public view returns(uint) {
        return result;
    }

    function getInfo() public view returns(uint) {
        return c.info();
    }
}