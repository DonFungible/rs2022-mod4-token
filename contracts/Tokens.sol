// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import {ERC1155, ERC1155Burnable} from "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";
import {Constants} from "./Library.sol";

contract Tokens is ERC1155Burnable, AccessControl {

	bytes32 public constant FORGER_ROLE = keccak256("FORGER_ROLE");
	bytes32 public constant OWNER_ROLE = keccak256("OWNER_ROLE");

    constructor() ERC1155("") {
		_setupRole(OWNER_ROLE, msg.sender);
	}

	function mint(uint256 tokenId) external {

		if (tokenId == uint256(Constants.TokenTypes.GEORGE)) {
			require(hasRole(FORGER_ROLE, msg.sender), "Only forger contracts can mint George");
		} else if (tokenId == uint256(Constants.TokenTypes.CASSANDRA)) {
			require(hasRole(FORGER_ROLE, msg.sender), "Only forger contracts can mint Cassandra");
		} else if (tokenId == uint256(Constants.TokenTypes.KIMBO)) {
			require(hasRole(FORGER_ROLE, msg.sender), "Only forger contracts can mint Kimbo");
		} else if (tokenId == uint256(Constants.TokenTypes.DRAKE)) {
			require(hasRole(FORGER_ROLE, msg.sender), "Only forger contracts can mint Drake");
		} else {
			require(
				tokenId == uint256(Constants.TokenTypes.BOB) ||
					tokenId == uint256(Constants.TokenTypes.MORRIS) ||
					tokenId == uint256(Constants.TokenTypes.JIMMY),
				"Incorrect mint type"
		); 
		_mint(msg.sender, tokenId, 1, "");
		}
	}

	function burn(uint256 tokenId, uint256 amount) external {
		require(hasRole(FORGER_ROLE, msg.sender), "Only forger contracts can mint George");
		_burn(msg.sender, tokenId, amount);
	}

	modifier onlyOwner() {
		require(hasRole(OWNER_ROLE, msg.sender), "Caller is not an owner");
		_;
	}
	
	function setForgerRole (address _forger) external onlyOwner {
		_setupRole(FORGER_ROLE, _forger);
	}

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC1155, AccessControl) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
