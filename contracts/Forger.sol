// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import {ERC1155, ERC1155Burnable} from "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Constants} from "./Library.sol";

interface IToken {
    function balanceOf(address owner, uint256 tokenId) external returns (uint256);
	function mint(address to, uint256 tokenId, uint256 amount) external;
	function burn(address from, uint256 tokenId, uint256 amount) external;
}

contract Forger {
    address public immutable TOKEN_ADDR;

    constructor(address _baseTokenAddress)  {
        TOKEN_ADDR = _baseTokenAddress;
    }

	function trade(uint256 tokenToGive, uint256 tokenToReceive) external {
		require(tokenToGive == uint256(Constants.TokenTypes.BOB) || tokenToGive == uint256(Constants.TokenTypes.MORRIS) || tokenToGive == uint256(Constants.TokenTypes.JIMMY), "Incorrect token to give");
		require(tokenToReceive == uint256(Constants.TokenTypes.BOB) || tokenToReceive == uint256(Constants.TokenTypes.MORRIS) || tokenToReceive == uint256(Constants.TokenTypes.JIMMY), "Incorrect token to receive");
		IToken(TOKEN_ADDR).burn(msg.sender, tokenToGive, 1);
		IToken(TOKEN_ADDR).mint(msg.sender, tokenToReceive, 1);
	}

	// Forge George by burning Bob and Morris
	function forgeGeorge() external {
		require(IToken(TOKEN_ADDR).balanceOf(msg.sender, uint256(Constants.TokenTypes.BOB)) > 0, "Need Bob");
		require(IToken(TOKEN_ADDR).balanceOf(msg.sender, uint256(Constants.TokenTypes.MORRIS)) > 0, "Need Morris");
		IToken(TOKEN_ADDR).burn(msg.sender, uint256(Constants.TokenTypes.BOB), 1);
		IToken(TOKEN_ADDR).burn(msg.sender, uint256(Constants.TokenTypes.MORRIS), 1);
		IToken(TOKEN_ADDR).mint(msg.sender, uint256(Constants.TokenTypes.GEORGE), 1);
	}

	// Forge Cassandra by burning Bob and Jimmy
	function forgeCassandra() external {
		require(IToken(TOKEN_ADDR).balanceOf(msg.sender, uint256(Constants.TokenTypes.BOB)) > 0, "Need Bob");
		require(IToken(TOKEN_ADDR).balanceOf(msg.sender, uint256(Constants.TokenTypes.JIMMY)) > 0, "Need Jimmy");
		IToken(TOKEN_ADDR).burn(msg.sender, uint256(Constants.TokenTypes.BOB), 1);
		IToken(TOKEN_ADDR).burn(msg.sender, uint256(Constants.TokenTypes.JIMMY), 1);
		IToken(TOKEN_ADDR).mint(msg.sender, uint256(Constants.TokenTypes.CASSANDRA), 1);
	}

	// Forge Kimbo by burning Morris and Jimmy
	function forgeKimbo() external {
		require(IToken(TOKEN_ADDR).balanceOf(msg.sender, uint256(Constants.TokenTypes.MORRIS)) > 0, "Need Morris");
		require(IToken(TOKEN_ADDR).balanceOf(msg.sender, uint256(Constants.TokenTypes.JIMMY)) > 0, "Need Jimmy");
		IToken(TOKEN_ADDR).burn(msg.sender, uint256(Constants.TokenTypes.MORRIS), 1);
		IToken(TOKEN_ADDR).burn(msg.sender, uint256(Constants.TokenTypes.JIMMY), 1);
		IToken(TOKEN_ADDR).mint(msg.sender, uint256(Constants.TokenTypes.KIMBO), 1);
	}

	// Forge Drake by burning Bob, Morris, and Jimmy
	function forgeDrake() external {
		require(IToken(TOKEN_ADDR).balanceOf(msg.sender, uint256(Constants.TokenTypes.BOB)) > 0, "Need Bob");
		require(IToken(TOKEN_ADDR).balanceOf(msg.sender, uint256(Constants.TokenTypes.MORRIS)) > 0, "Need Morris");
		require(IToken(TOKEN_ADDR).balanceOf(msg.sender, uint256(Constants.TokenTypes.JIMMY)) > 0, "Need Jimmy");
		IToken(TOKEN_ADDR).burn(msg.sender, uint256(Constants.TokenTypes.BOB), 1);
		IToken(TOKEN_ADDR).burn(msg.sender, uint256(Constants.TokenTypes.MORRIS), 1);
		IToken(TOKEN_ADDR).burn(msg.sender, uint256(Constants.TokenTypes.JIMMY), 1);
		IToken(TOKEN_ADDR).mint(msg.sender, uint256(Constants.TokenTypes.DRAKE), 1);
	}

}
