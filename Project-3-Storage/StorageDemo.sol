// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract StorageDemo {
    // Declare a state variable to store data in storage
    uint256 public storedData;

    // Function to update the storedData variable in storage
    function updateData(uint256 newData) public {
        storedData = newData;
    }
}