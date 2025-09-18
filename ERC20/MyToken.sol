// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./implementation.sol";

/**
 * @title MyToken
 * @dev This is an implementation of an ERC20 token.
 * It initializes a total supply and assigns it to the deployer.
 */
contract MyToken is ERC20Implementation {
    constructor(
        uint256 initialSupply
    ) ERC20Implementation("MTEToken", "MTE", 18) {
        _mint(msg.sender, initialSupply); // Mint the initial supply and assign to deployer
    }
}
