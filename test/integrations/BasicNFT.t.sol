//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BasicNFT} from "../../src/BasicNFT.sol";
import {DeployBasicNFT} from "../../script/DeployBasicNFT.s.sol";

contract BasicNFTTest is Test {
    DeployBasicNFT public deployer;
    BasicNFT public nft;
    address USER = makeAddr("user");
    string public constant DESIGNER_PUG =
        "ipfs://QmQNfTA2QxqNcJMr8FDMuhHJvv7eac2R836wpyQQsxffsx?filename=designer-pug.json";

    function setUp() public {
        deployer = new DeployBasicNFT();
        nft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = nft.name();
        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        nft.mintNft(DESIGNER_PUG);
        assert(nft.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(DESIGNER_PUG)) == keccak256(abi.encodePacked(nft.tokenURI(0))));
    }
}
