/**
// Our first contract is a faucet!
contract Faucet {
    // Give out ether to anyone who asks

    function withdraw(uint withdraw_amount) public {
        // Limit withdrawal amount
        require(withdraw_amount <= 100000000000000000);

        // Send the amount to the address that requested it
        msg.sender.transfer(withdraw_amount);
    }
    // Accept any incoming amount
    function() public payable {}
}

*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Faucet {
    function withdraw(uint withdraw_amount) public {
        require(
            withdraw_amount <= 0.1 ether,
            "Withdrawal amount exceeds limit"
        );
        payable(msg.sender).transfer(withdraw_amount);
    }

    // Fallback: Accept any incoming amount
    receive() external payable {}
}
