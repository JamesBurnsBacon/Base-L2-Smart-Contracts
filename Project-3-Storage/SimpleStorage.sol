// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract EmployeeStorage {
    uint8 public age;
    uint8 public cars; // for types smaller than 32 bytes, multiple variables of the same type will be packed in the same storage slot. Vars must be declared together.
    constructor(uint8 _numberOfCars, uint8 _numberAge) {
        cars = _numberOfCars;
        age = _numberAge;
    }
    function updateCars(uint8 _numberOfCars) public {
        cars = _numberOfCars;
    }
    function updateAge() public {
        age++;
    }
    function adminSetAge(uint8 _numberAge) public {
        age = _numberAge;
    }
}

// Three primary types of storage in Eth smart contracts: storage, memory, stack
// Storage is the most persistent and expensive form of data storage. Persists across Tx and is accessible to any function in contract scope. Can be read externally.
// Memory is only available during a single Tx and is lost afterward, less expensive vs. Storage, not visible on blockchain.
// Stack has LIFO structure, highly efficient but limited space. Used for intermediate tx and operations. Not directly touched. Max depth of 1024. Only top 16 accessible.
// Group variable declarations of the same size together.