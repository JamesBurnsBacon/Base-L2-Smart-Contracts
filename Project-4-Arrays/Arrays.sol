// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Arrays {
    uint[] public dynamicArray;

    uint[10] public fixedArray; //size cap of ten, declared as state variables in storage

    function addElementToDynamicArray(uint _newElement) external {
        dynamicArray.push(_newElement); 
    }

    function removeLastElementOfDynamicArray() external {
        dynamicArray.pop();
    }
}