# MyToken (ERC-20 Implementation)

This project contains a simple implementation of the [ERC-20 standard](https://eips.ethereum.org/EIPS/eip-20).  
It defines the core `IERC20` interface, provides a base implementation `ERC20Implementation`, and deploys a token `MyToken` with the following details:

- **Name**: `MTEToken`
- **Symbol**: `MTE`
- **Decimals**: `18`
- **Total Supply**: defined by the deployer at deployment

---

## Project Structure

.
├── IERC20.sol # ERC20 interface
├── ERC20Implementation.sol # Base ERC20 implementation
├── MyToken.sol # Final token contract

---

## Features

- `name()` → Returns the token name (`MTEToken`)
- `symbol()` → Returns the token symbol (`MTE`)
- `decimals()` → Returns `18` (standard for ERC-20)
- `totalSupply()` → Returns total token supply
- `balanceOf(address)` → Returns balance of an account
- `transfer(address, uint256)` → Transfers tokens from sender to recipient
- `approve(address, uint256)` → Approves spender to spend tokens on behalf of owner
- `allowance(address, address)` → Returns remaining approved allowance
- `transferFrom(address, address, uint256)` → Transfers tokens on behalf of owner (if approved)
- `mint(address, uint256)` → Internal function to mint new tokens

---

## Deployment (Remix Desktop)

1. Open **Remix Desktop Client**.
2. Load your project folder containing the contracts.
3. Compile contracts:
   - Go to the **Solidity Compiler** tab.
   - Select version `0.8.x` (e.g., `0.8.30`).
   - Click **Compile MyToken.sol**.
4. Deploy contracts:
   - Go to the **Deploy & Run Transactions** tab.
   - Select `MyToken` contract.
   - In the constructor field, enter the **initial supply** (e.g., `1000000` for 1M tokens).
   - Click **Deploy**.
   - The contract will be deployed and visible under **Deployed Contracts**.

---

## Notes

- Built with **Solidity ^0.8.0** → no need for SafeMath (overflow/underflow checks are built in).
- `_mint` is used inside the constructor to create the initial supply.

---

## License

This project is licensed under the [MIT License](./LICENSE).
