// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Create an auction contract

contract Auction {
    // Set up auctio variables
    address payable public beneficiary;
    uint public auctionEndTime;

    // Set current state of auction
    address public highestBidder;
    uint public highestBid;
    bool ended;

    // Create mapping to return bids
    mapping(address => uint) pendingReturns;

    // Set up events
    event highestBidIncreased(address bidder, uint amount);
    event auctionEnded(address winner, uint amount);

    constructor(uint _biddingTime, address payable _beneficiary) {
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime;
    }

    // Function to bid
    function bid() public payable {
        // If bid it too late revert the bid
        if(block.timestamp > auctionEndTime) {
            revert("Auction has ended')");
        }

        // If this bid is not high enough send the money back
        if(msg.value <= highestBid) {
            revert("The bid is not high enough");
        }

        // Return bid
        if(highestBid != 0) {
            pendingReturns[highestBidder] += highestBid;
        }

        // Set up bid
        highestBidder = msg.sender;
        highestBid = msg.value;
        emit highestBidIncreased(msg.sender, msg.value);
    }

        // Use widthdraw pattern to withdraw bids that were overbid
        function withdraw() public payable returns (bool) {
            uint amount = pendingReturns[msg.sender];
            if(amount > 0) {
                pendingReturns[msg.sender] = 0;
            }

            if(!payable(msg.sender).send(amount)) {
                pendingReturns[msg.sender] = amount;
            }
            return true;
    }

    // Function to end the auction
    function auctionEnd() public {
        if(block.timestamp < auctionEndTime) {
            revert("The auction has not ended yet");
        }
        if(ended) {
            revert("The auction is already over");
        }

        ended = true;
        emit auctionEnded(highestBidder, highestBid);
        beneficiary.transfer(highestBid);
    }
}