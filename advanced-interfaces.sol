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

// Exercise 01: Create an interface to connect to uniswap

// Interface to get pairs from uniswap
interface UniswapV2Factory {
    function getPair(address tokenA, address tokenB) external view returns (address pair);
}

// Interface to get reserve values of pairs from uniswap
interface UniswapV2Pair {
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract MyContract2 {
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address private usdc = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    // Get pair of tokens and set it to an address pair
    function getReserveToken() external view returns(uint, uint) {
        address pair = UniswapV2Factory(factory).getPair(weth, usdc);

        // Use address from pair to get reserve values
        (uint reserve0, uint reserve1,) = UniswapV2Pair(pair).getReserves();
        return(reserve0, reserve1);

    }

}