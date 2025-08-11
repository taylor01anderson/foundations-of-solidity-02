// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* a cryptographic has function is an algorithm that mpas data (often called a message) to a bit arry of a fixed
size hash value or hash or message digest.

Solidity includes functions like:
-keccak256 (bytes memory) returns (bytes32)
-sha256 (bytes memory) returns (bytes32)
-ripemd160 (bytes memory) returns (bytes20)
*/

// contract that generates a random number within a range by using abi information and the modulus function
// The range will be within the range parameter -1
contract GenerateRandomNumber {
    Oracle oracle;

    constructor(address oracleAddress) {
        oracle = Oracle(oracleAddress);
    }

    function random(uint range) external view returns(uint) {
        // abi.encodePacked concatonates abi arguments
        // block.difficulty was updated to prevrandao which returns a random number based on the beacon chain
        
        // Learn random number gen with abi and %
        // return uint(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, msg.sender))) % range;
        // upgrade with exercise 01
        return uint(keccak256(abi.encodePacked(oracle.rand(), block.timestamp, block.prevrandao, msg.sender))) % range;
    }
}

/*
Exercise 01: The above contract provides too much information about how the number was generated
Solution: use oracle dynamic feeds

*/

contract Oracle {
    address admin;
    uint public rand;

    constructor () {
        admin = msg.sender;
    }
        function setRand(uint _set) external {
            require(msg.sender == admin);
            rand = _set;
    }
}