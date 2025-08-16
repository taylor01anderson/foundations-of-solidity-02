// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Solidity provides an option to write inline assembly within the solidty source cod

contract LearnAssembly {
    function addToEVM() external {
        uint x;
        uint y;
        uint z = x = y;

    // Assembly lannguage can be accessed with the assembly keyword 
    // no semi colons, = is :=
    assembly {
        let a := add(x,y)

        //load data for a specific slot
        let b := mload(0x40)

        // store something temporarily to memory
        mstore(a,4)

        // perstistance storage
        sstore(a, 100)

    }
    }

    function addToEVM2() public view returns(bool success) {
        uint size;

        // chechk whether an address contains any bytes of code or not
        assembly {
            size := extcodesize(0x0000000000000000000000000000000000000000)
        }
        if (size > 0) {
            return true;
        } else {
            return false;
        }
    }

    // Exercise 01: Converting bytes using assembly
    function addToEVM3() external pure {
        bytes memory data = new bytes(10);

        // We cannot convert this into a fixed size
        bytes32 dataB32 = bytes32(data);

        assembly {
            dataB32 := mload(add(data, 32))
        }
    }
}