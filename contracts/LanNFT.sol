// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "./erc721.sol";

contract LanNFT is ERC721 {
    string public name; //ERC721 metadata
    string public symbol; //ERC721 metadata
    uint256 public tokenCount;
    mapping(uint256 => string) private _tokenURIs;

    // Constructor function: Phương thức khởi tạo
    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
    }

    // tokenURI function:
    function tokenURI(uint256 tokenId) public view returns (string memory) {
        require(_owners[tokenId] != address(0), "Token ID does not exist");
        return _tokenURIs[tokenId];
    }

    // function mint
    function mint(string memory _tokenURI) public {
        //ERC721 metadata
        tokenCount += 1; //tokenID
        _balances[msg.sender] += 1;
        _owners[tokenCount] = msg.sender;
        _tokenURIs[tokenCount] = _tokenURI;

        emit Transfer(address(0), msg.sender, tokenCount);
    }

    function supportsInterface(
        bytes4 interfaceID
    ) public pure override returns (bool) {
        return interfaceID == 0x80ac58cd || interfaceID == 0x5b5e139f;
    }
}
