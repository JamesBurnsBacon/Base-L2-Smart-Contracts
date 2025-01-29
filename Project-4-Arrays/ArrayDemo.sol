// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ArrayDemo {
    uint numEven;
    uint[] public numbers;

    function getEvenNumbers() external view returns(uint[] memory) {
        uint resultsLen = numEven; //_countEvenNumbers();
        uint[] memory results = new uint[](resultsLen);
        uint cursor = 0;

        for(uint i = 0; i < numbers.length; i++) {
            if(numbers[i] % 2 == 0) {
                results[cursor] = numbers[i];
                cursor++;
            }
        }
        return results;
    }

    function _countEvenNumbers() internal view returns(uint) {
        uint EvenNumbersTotal = 0;
        for(uint i=0; i < numbers.length; i++) {
            if(numbers[i] % 2 == 0) {
                EvenNumbersTotal++;
            }
        }
        return EvenNumbersTotal;
    }

    function debugLoadArray(uint _number) external {
        for(uint i = 0; i < _number; i++) {
            numbers.push(i);
            if(i % 2 == 0) {
                numEven++;
            }
        }
    }
} // no cost to call view or pure functions from a front end app!