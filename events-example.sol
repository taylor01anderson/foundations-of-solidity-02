// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Events are information emitted to the outside world about what is going on
// Events aren't stored as memory which menas you can't read them in the past
// They are only for entities outside of the blockchain
// You can add keywork indexed allows outsider consumer to filter out information they need
// Indexed costs gas and only three are allowed

// To create an event
// 1: Declare the event
// 2: Emit the event

contract LearnEvents {

    // Declare the even
    event newTrade(
        address from,
        address to,
        uint indexed date,
        uint amount
    );

    function trade(address to, uint amount) external {
    // Emit the event
    emit newTrade(msg.sender, to, block.timestamp, amount);
    }
}