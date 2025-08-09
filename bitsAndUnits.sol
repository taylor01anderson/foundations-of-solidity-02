// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// uint is an unsigned integer, cannot be negative
// uint is short for uint256
// uint 256 min is 0 andmax is 2^256-1
// uint32 and uint16 apply the same principle, they have less information and are less computationally expensive
// int is a signed integer
// use variables wisely to reduce gas costs

contract learnConversions {
    // To convert from uint32 to uint16
    uint32 a = 0x12345678;
    uint16 b = uint16(a);
    // b = 0x5678

    // To convert from uint32 to uint16
    uint16 c = 0x1234;
    uint d = uint32(c);
    // d = 0x00001234

    // To convert bytes higher to lower
    // Conversion to smaller type costs higher order data (first in order)
    bytes2 e = 0x1234;
    bytes1 f = bytes1(e);
    // f = 0x12

    // To convert lower to higher
    // Conversion to higher type adds padding bits to the right
    bytes2 g = 0x1234;
    bytes4 h = bytes4(g);
    // h = 0x12340000
}