// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// fallback functions are anonymous and don't have names
// they never take inputs and never return outputs
// they must be declared as external

// to learn: gas costs using send and transfer vs transfer functions
// using send and transfer invokes 2300 gas to emit a log
// you can send ether with send, transfer, or call

// There is a warning that there is no receive function, but there is a payable function which makes it ok
contract Fallback  {
    event Log(uint gas);

    // fallback function returns gas left and has a limit of 2300 gas
    fallback() external payable {
        emit Log(gasleft());
    }

    // verify gas costs
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

// write new contract that can receive ether to Fallback contract 
contract SendToFallback {

    // send ether with transfer method and gas amount
    function transferToFallback(address payable _toFallback) public payable {
        _toFallback.transfer(msg.value);
    }

    // send ether with call method
    function callFallback(address payable _toFallback) public payable {
        (bool sent,) = _toFallback.call{value: msg.value}('test');
        require(sent, 'Failed to send');
    }
}