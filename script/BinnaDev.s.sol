// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {BinnaDev} from "../src/BinnaDev.sol";

contract DeployBinnaDev is Script {
    function run() external returns (BinnaDev) {
        address INITIAL_OWNER = msg.sender;

        vm.startBroadcast();
        BinnaDev binnaDev = new BinnaDev(INITIAL_OWNER);
        vm.stopBroadcast();

        return binnaDev;
    }
}
