// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title BinnaDev Token Contract
 * @author Obinna Franklin Duru
 * @notice This contract represents the BinnaDev token, which is an ERC20 token with burnable, pausable, and ownable functionality.
 * @dev This contract uses OpenZeppelin's ERC20, ERC20Burnable, ERC20Pausable, and Ownable contracts.
 */
contract BinnaDev is ERC20, ERC20Burnable, ERC20Pausable, Ownable {
    /**
     * @notice Initializes the contract with the given initial owner.
     * @param initialOwner The initial owner of the contract.
     */
    constructor(address initialOwner) ERC20("BinnaDev", "BD") Ownable(initialOwner) {}

    /**
     * @notice Pauses the contract, preventing any token transfers.
     * @dev Only the owner can call this function.
     */
    function pause() public onlyOwner {
        _pause();
    }

    /**
     * @notice Unpauses the contract, allowing token transfers again.
     * @dev Only the owner can call this function.
     */
    function unpause() public onlyOwner {
        _unpause();
    }

    /**
     * @notice Mints the specified amount of tokens to the given address.
     * @param to The address to mint tokens to.
     * @param amount The amount of tokens to mint.
     * @dev Only the owner can call this function.
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // The following functions are overrides required by Solidity.

    /**
     * @notice Updates the token balances of the given addresses.
     * @param from The address to subtract tokens from.
     * @param to The address to add tokens to.
     * @param value The amount of tokens to transfer.
     * @dev This function is an override required by Solidity.
     */
    function _update(address from, address to, uint256 value) internal override(ERC20, ERC20Pausable) {
        super._update(from, to, value);
    }
}
