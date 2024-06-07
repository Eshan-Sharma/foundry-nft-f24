//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {Script} from "forge-std/Script.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract MintBasicNFT is Script {
    string public constant DESIGNER_PUG =
        "ipfs://QmQNfTA2QxqNcJMr8FDMuhHJvv7eac2R836wpyQQsxffsx?filename=designer-pug.json";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNFT", block.chainid);
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNFT(contractAddress).mintNft(DESIGNER_PUG);
        vm.stopBroadcast();
    }
}
