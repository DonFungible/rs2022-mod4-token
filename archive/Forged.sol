// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import {ERC1155, ERC1155Burnable} from "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

interface IBase {
    function balanceOf(address owner, uint256 tokenId)
        external
        returns (uint256);
}

contract Forged is ERC1155Burnable, Ownable {
    enum MintTypes {
        BOB,
        MORRIS,
        JIMMY
    }

    enum ForgeTypes {
        GEORGE,
        CASSANDRA,
        KIMBO,
        DRAKE
    }

    MintTypes public mintTypes;
    ForgeTypes public forgeTypes;
    address public immutable BASE_TOKEN_ADDRESS;

    constructor(address _baseTokenAddress) ERC1155("") {
        BASE_TOKEN_ADDRESS = _baseTokenAddress;
    }

    function mint(uint256 tokenId) external {
        _mint(msg.sender, tokenId, 1, "");
    }

    function forgeGeorge() external {
        require(
            IBase(BASE_TOKEN_ADDRESS).balanceOf(
                msg.sender,
                uint256(MintTypes.BOB)
            ) > 0,
            "Need Bob"
        );
        require(
            balanceOf(msg.sender, uint256(MintTypes.MORRIS)) > 0,
            "Need Morris"
        );
        _burn(msg.sender, uint256(MintTypes.BOB), 1);
        _burn(msg.sender, uint256(MintTypes.MORRIS), 1);
        _mint(msg.sender, uint256(ForgeTypes.GEORGE), 1, "");
    }

    function forgeCassandra() external {
        require(balanceOf(msg.sender, uint256(MintTypes.BOB)) > 0, "Need Bob");
        require(
            balanceOf(msg.sender, uint256(MintTypes.JIMMY)) > 0,
            "Need Jimmy"
        );
        _burn(msg.sender, uint256(MintTypes.BOB), 1);
        _burn(msg.sender, uint256(MintTypes.JIMMY), 1);
        _mint(msg.sender, uint256(ForgeTypes.CASSANDRA), 1, "");
    }

    function forgeKimbo() external {
        require(
            balanceOf(msg.sender, uint256(MintTypes.MORRIS)) > 0,
            "Need Morris"
        );
        require(
            balanceOf(msg.sender, uint256(MintTypes.JIMMY)) > 0,
            "Need Jimmy"
        );
        _burn(msg.sender, uint256(MintTypes.BOB), 1);
        _burn(msg.sender, uint256(MintTypes.MORRIS), 1);
        _mint(msg.sender, uint256(ForgeTypes.GEORGE), 1, "");
    }

    function forgeDrake() external {
        require(balanceOf(msg.sender, uint256(MintTypes.BOB)) > 0, "Need Bob");
        require(
            balanceOf(msg.sender, uint256(MintTypes.MORRIS)) > 0,
            "Need Morris"
        );
        require(
            balanceOf(msg.sender, uint256(MintTypes.JIMMY)) > 0,
            "Need Jimmy"
        );
        _burn(msg.sender, uint256(MintTypes.BOB), 1);
        _burn(msg.sender, uint256(MintTypes.MORRIS), 1);
        _mint(msg.sender, uint256(ForgeTypes.GEORGE), 1, "");
    }
}
