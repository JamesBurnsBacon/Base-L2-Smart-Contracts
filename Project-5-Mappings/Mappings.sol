// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract Mappings {
    mapping (address => uint) public favoriteNumbers;
    address[] senders;

    function saveFavoriteNumber(uint _num) public {
        if(favoriteNumbers[msg.sender] == 0) { senders.push(msg.sender); } 
        favoriteNumbers[msg.sender] = _num; 
    }

    function returnAllFavorites() public view returns (uint[] memory) {
        uint[] memory allFavorites = new uint[](senders.length);

        for(uint i = 0; i < senders.length; i++) {
            allFavorites[i] = favoriteNumbers[senders[i]];
        }

        return allFavorites;
    }
}

// in solidity, the hashtable/hashmap/dictionary-comparable type used to store key-value pairs in called a mapping. not a hash table.
// in EVM mappings do not have an array as their underlying data struct. The hash of the key plus the storage slot for the mapping itself 
// determined which storage slot of 2**256 will be used for the value. No collision handling. Mappings can only have a data location of storage.
// They can't be used as parameters or returns of public functions. They are not iterable; you cannot retrieve a list of keys
// all possible keys will return a default value unless another value has been stored.