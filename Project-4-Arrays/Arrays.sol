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

contract StorageArray {
    // Variables declared at the class level are always `storage`
    uint[] arr = [1, 2, 3, 4, 5];

    function function_1() public {
        uint[] storage arr2 = arr;

        arr2[0] = 99; // <- arr is now [99, 2, 3, 4, 5];
    }
}

// storage, memory, calldata keywords
// storage is used to assign state variables that become a part of the blockchain as a part of the storage for your contract. Remain assinged until modified.
// storage is very expensive, with a minimum of 20000 gas to store a value in a slot.
// memory creates temporary variables that only exist within the scope in which they are created; copying from storage can be expensive too
// calldata storage location is where function arguments are stored. It is non-modifiable and the Solidity docs recommend using it where possible to avoid copying.

// Assignnments between storage and memory always create an independent copy
// Assignments from memory to memory only create references
// Assignments from storage to a local storage variable also only assign a reference.
// All other assignments to storage always copy.

// Arrays in storage are passed by reference- any changes you make will always modify the original, underlying storage array.
// you cannot use a storage array as a function param, and you cannot write a function that returns a storage array.
// storage arrays are dynamic unless declared with explicit size.
// .push(value) function adds to end of array
// .pop() function removes the last element of an array, but does not return that value.
// .pop() also only works to remove one element from the end.
// delete array[index] can remove elements, and delete array; will clear the array but not resize it.
// storage arrays are implicitly convertible to memory arrays
// arrays declared as memory are temporary and only exist within the scope in which they are created. Arrays in memory are not dynamic and must be declared with a size.
// valid solutions for filtering and returning a smaller array
// looping through twice, first to count, then to copy
// tracking the number of elements that meet condition X with a storage variable, then instatiating the array with
// <Type>[] memory filteredArray = new <Type>[](numX);
// calling multiple data structs to track refs to diff subsets