// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title IERC20 Interface
 * @dev It defines the standard functions and events for an ERC20 token.
 */
interface IERC20 {
    // functions
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(
        address recipient,
        uint256 amount
    ) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    // events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

/**
    name: Token's name: MTEToken.
    symbol: Token's symbol: MTE.
    decimals: Number of token's decimals: 18.
    totalSupply: Total supply of tokens.
    balanceOf: Get the address' balance
    transfer: Transfer from sender to recipient
    approve: Approve a spender to withdraw from owner's account
    allowance: Get the amount approved to a spender to withdraw from an owner.
    transferFrom: Transfer token from sender to recipient, prior approval required with approve()
    Approval: emitted when approve() is called
 */
