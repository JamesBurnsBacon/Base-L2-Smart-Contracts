// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ArrayDemo {
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];

    function getEvenNumbers() external view returns(uint[] memory) {
        uint resultsLen = _countEvenNumbers();
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
}