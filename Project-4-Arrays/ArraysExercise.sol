// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ArraysExercise {
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    uint[] public timestamps;
    address[] public senders;
    
    function getNumbers() view external returns (uint[] memory) {
        return numbers;
    }

    function resetNumbers() public {
        numbers = [1,2,3,4,5,6,7,8,9,10];
    }

    function appendToNumbers(uint[] calldata _toAppend) external {

    }

    function saveTimestamp(uint _unixTimeStamp) external {
        timestamps.push(_unixTimeStamp);
        // retrieve address and add to array
    }

    function afterY2K() external returns(uint[] memory, address[] memory){
        // filter timestamps and senders to only unix > 946702800
        
    }

    function resetSenders() public {

    }

    function resetTimestamps() public {

    }
}
