// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Base721 is ERC721, Ownable {
    enum MintTypes {
        BOB,
        MORRIS,
        JIMMY
    }

    MintTypes public mintTypes;

    constructor() ERC721("T", "T") {}

    function mint(uint256 tokenId) external {
        require(
            tokenId == uint256(MintTypes.BOB) ||
                tokenId == uint256(MintTypes.MORRIS) ||
                tokenId == uint256(MintTypes.JIMMY),
            "Incorrect mint type"
        );
        _mint(msg.sender, tokenId);
    }
}
