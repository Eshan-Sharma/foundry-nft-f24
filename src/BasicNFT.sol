//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256) private s_tokenCounter;
    

    constructor() ERC721("Dogie", "DOG") {
        s_tokenCounter = 0;
    }

    function mintNft(string memory token) public {}

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        return "";
    }
}