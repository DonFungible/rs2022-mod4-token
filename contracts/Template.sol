// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Template is ERC721 {
    constructor() ERC721("TEMPLATE", "T") {}

    function _fcn() internal virtual {
        return;
    }
}
