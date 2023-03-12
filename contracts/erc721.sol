// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract ERC721 {
    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 indexed _tokenId
    );
    event Approval(
        address indexed _owner,
        address indexed _approved,
        uint256 indexed _tokenId
    );
    event ApprovalForAll(
        address indexed _owner,
        address indexed _operator,
        bool _approved
    );

    mapping(address => uint256) internal _balances;
    mapping(uint256 => address) internal _owners;
    mapping(address => mapping(address => bool)) private _operatorApprovals;
    mapping(uint256 => address) private _tokenApprovals;

    //  return the number of NFTs of an user.
    function balanceOf(address owner) external view returns (uint256) {
        require(owner != address(0), "Address is zero");
        return _balances[owner];
    }

    //  find the owner of  an NFT
    function ownerOf(uint256 tokenId) public view returns (address) {
        address owner = _owners[tokenId];
        require(owner != address(0), "Token ID does not exist");
        return owner;
    }

    // enable or disable an operator
    // Operator được phép approved
    function setApprovalForAll(address operator, bool approved) external {
        _operatorApprovals[msg.sender][operator] = approved;
        emit ApprovalForAll(msg.sender, operator, approved);
    }

    // Check if an address is an operator for another address
    function isApprovedForAll(
        address owner,
        address operator
    ) public view returns (bool) {
        return _operatorApprovals[owner][operator];
    }

    // enable or disable (approved) addredd of an NFT
    function approve(address to, uint256 tokenId) public payable {
        address owner = ownerOf(tokenId);
        require(
            msg.sender == owner || isApprovedForAll(owner, msg.sender),
            "msg.sender is not the owner or the approved operator"
        );
        _tokenApprovals[tokenId] = to;
        emit Approval(owner, to, tokenId);
    }

    // Get the approved address for an NFT
    function getApproved(uint256 tokenId) public view returns (address) {
        require(_owners[tokenId] != address(0), "Token ID does not exist");
        return _tokenApprovals[tokenId];
    }

    // transfer tokenId. from => to
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public payable {
        address owner = ownerOf(tokenId);
        require(
            msg.sender == owner ||
                msg.sender == getApproved(tokenId) ||
                isApprovedForAll(owner, msg.sender),
            "msg.sender is not the owner or approved for transfer"
        );
        require(owner == from, "from address is not the owner");
        require(to != address(0), "address is the zero address");
        require(_owners[tokenId] != address(0), "Token ID does not exist");

        approve(address(0), tokenId);
        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(from, to, tokenId);
    }

    // Kiểm tra contract đó có chức năng nhận hay không.
    // Like transferFrom method
    // check if the receiver smart contract is capable of receiving NFT
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) public payable {
        transferFrom(from, to, tokenId);
        require(_checkOnERC721Received(), "Receiver not implemented");
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external payable {
        safeTransferFrom(from, to, tokenId, "");
    }

    // Simple version check for NFT receivebility of a smart contract
    function _checkOnERC721Received() private pure returns (bool) {
        return true;
    }

    // EIP165 proposal: query if a contract implements another interface
    function supportsInterface(
        bytes4 interfaceID
    ) public pure virtual returns (bool) {
        return interfaceID == 0x80ac58cd;
    }
}
