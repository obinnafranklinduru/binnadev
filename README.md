# BinnaDev Token

BinnaDev Token is a decentralized ERC20 token on the Ethereum blockchain that incorporates burnable, pausable, and ownable functionalities. This contract uses OpenZeppelin's libraries for secure and efficient smart contract development, providing flexible token management capabilities for the contract owner.

## Contract Details

- **Sepolia Etherscan Link:** [View Contract on Etherscan](https://sepolia.etherscan.io/address/0x46B8cBe7B5A3a8c1BBb17E51BbF763a802f3b2c6)
- **Contract Address:** `0x46B8cBe7B5A3a8c1BBb17E51BbF763a802f3b2c6`

## Features

- **Burnable Tokens:** Allows tokens to be irreversibly burned, reducing the total supply.
- **Pausable Contract:** Enables the owner to pause and unpause all token transfers.
- **Ownership Control:** Only the owner can mint new tokens and manage contract pauses.
- **OpenZeppelin Libraries:** Utilizes OpenZeppelin's ERC20, ERC20Burnable, ERC20Pausable, and Ownable contracts.

## Table of Contents

- [BinnaDev Token](#binnadev-token)
  - [Features](#features)
  - [Getting Started](#getting-started)
    - [Requirements](#requirements)
    - [Installation](#installation)
    - [Deployment](#deployment)
  - [Usage](#usage)
    - [Minting Tokens](#minting-tokens)
    - [Burning Tokens](#burning-tokens)
    - [Pausing and Unpausing](#pausing-and-unpausing)
  - [Testing](#testing)
  - [Contributing](#contributing)

## Getting Started

### Requirements

- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - Ensure Git is installed by running `git --version`.
- [Foundry](https://getfoundry.sh/)
  - Ensure Foundry is installed by running `forge --version`.
- [Make](https://www.gnu.org/software/make/)
  - Ensure Make is installed by running `make --version`.

### Installation

Clone the repository and remove dependencies:

```bash
git clone https://github.com/obinnafranklinduru/binnadev
cd binnadev
make remove
```

Install dependencies:

```bash
make install
```

Update dependencies to the latest versions:

```bash
make update
```

### Deployment

Ensure you have the necessary environment variables set in a `.env` file:

```env
SEPOLIA_RPC_URL=<your_sepolia_rpc_url>
PRIVATE_KEY=<your_private_key>
ETHERSCAN_API_KEY=<your_etherscan_api_key>
```

Deploy the contract using the Makefile:

```bash
make deploy ARGS="--network sepolia"
```

## Usage

### Minting Tokens

The contract owner can mint new tokens to a specified address.

```solidity
function mint(address to, uint256 amount) public onlyOwner {
    _mint(to, amount);
}
```

### Burning Tokens

Users can burn their tokens, reducing the total supply.

```solidity
function burn(uint256 amount) public {
    _burn(msg.sender, amount);
}
```

### Pausing and Unpausing

The owner can pause and unpause the contract to stop and resume token transfers.

```solidity
function pause() public onlyOwner {
    _pause();
}

function unpause() public onlyOwner {
    _unpause();
}
```

## Testing

Run tests to ensure the contract functions as expected.

```bash
make test
```

## Limitations

- **Centralized Control:** The owner has significant control over minting and pausing, which may be a limitation in a decentralized context.
- **Single Currency:** The contract is designed to operate exclusively with the BinnaDev token.
