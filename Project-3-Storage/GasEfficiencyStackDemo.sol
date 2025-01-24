// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract GasEfficiencyStackDemo {
    uint256 public result;

    // Less efficient
    function sumLessEfficient(uint256 a, uint256 b) public {
        uint256 temp = a + b;
        result = temp;
    }

    // More efficient
    function sumMoreEfficient(uint256 a, uint256 b) public {
        result = a + b;
    }
}