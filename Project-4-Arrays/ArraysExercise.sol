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
        for(uint index = 0; index < _toAppend.length; index++) {
            numbers.push(_toAppend[index]);
        }
    }

    function saveTimestamp(uint _unixTimeStamp) external {
        timestamps.push(_unixTimeStamp);
        // retrieve address and add to array
        senders.push(msg.sender);
    }

    function afterY2K() external view returns(uint[] memory, address[] memory){
        // filter timestamps and senders to only unix > 946702800
        // like the evens example
        uint validTimestampsCount = 0;
        for(uint index=0; index < timestamps.length; index++) {
            if(timestamps[index] > 946702800) {
                validTimestampsCount++;
            }
        }
        uint[] memory timestampsReturn = new uint[](validTimestampsCount);
        address[] memory sendersReturn = new address[](validTimestampsCount);

        uint rIndex = 0;
        for(uint index=0; index < timestamps.length; index++) {
            if(timestamps[index] > 946702800) {
                timestampsReturn[rIndex] = timestamps[index];
                sendersReturn[rIndex] = senders[index];
                rIndex++;
            }
        }
        return (timestampsReturn, sendersReturn);
    }

    function resetSenders() public {
        delete senders;
    }

    function resetTimestamps() public {
        delete timestamps;
    }
}
