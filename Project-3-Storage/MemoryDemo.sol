// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MemoryDemo {
    // Declare a state variable to store data in storage
    uint256 public storedData;

    // Function to update the storedData variable in memory
    function updateData(uint256 newData) public {
        // Declare a memory variable to store the new data
        uint256 tempData = newData;

        // Assign the value of the memory variable to the storage variable
        storedData = tempData;
    }
}