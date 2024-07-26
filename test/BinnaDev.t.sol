// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/BinnaDev.sol";

contract BinnaDevTest is Test {
    BinnaDev public binnaDev;
    address public owner;
    address public alice;
    address public bob;

    function setUp() public {
        owner = makeAddr("owner");
        bob = makeAddr("bob");
        alice = makeAddr("alice");

        vm.startPrank(owner);
        binnaDev = new BinnaDev(owner);
        vm.stopPrank();
    }

    function testMinting() public {
        vm.startPrank(owner);
        binnaDev.mint(alice, 1000 * 10 ** 18);
        assertEq(binnaDev.balanceOf(alice), 1000 * 10 ** 18);
        vm.stopPrank();
    }

    function testBurning() public {
        vm.startPrank(owner);
        binnaDev.mint(owner, 1000 * 10 ** 18);
        binnaDev.burn(500 * 10 ** 18);

        assertEq(binnaDev.balanceOf(owner), 500 * 10 ** 18);
        vm.stopPrank();
    }

    function testPausing() public {
        vm.startPrank(owner);
        binnaDev.mint(owner, 1000 * 10 ** 18);
        binnaDev.pause();

        vm.expectRevert();
        binnaDev.transfer(bob, 500 * 10 ** 18);

        binnaDev.unpause();
        binnaDev.transfer(bob, 500 * 10 ** 18);
        assertEq(binnaDev.balanceOf(bob), 500 * 10 ** 18);
        vm.stopPrank();
    }

    function testTransfer() public {
        vm.startPrank(owner);
        binnaDev.mint(alice, 1000 * 10 ** 18);
        vm.stopPrank();

        vm.prank(alice);
        binnaDev.transfer(bob, 300 * 10 ** 18);
        assertEq(binnaDev.balanceOf(bob), 300 * 10 ** 18);
        assertEq(binnaDev.balanceOf(alice), 700 * 10 ** 18);
    }
}
