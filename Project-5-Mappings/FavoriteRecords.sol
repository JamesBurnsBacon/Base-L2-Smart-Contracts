// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract FavoriteRecords {
    error NotApproved(string _recordName);
    error AlreadyAdded(string _recordName);
    mapping (string => bool) public approvedRecords;
    mapping (address => mapping(string => bool)) userFavorites;
    mapping (address => uint) accountFavoritesCount;
    address[] users; //necessary?
    string[] records; //internal to function, list of good records

    constructor() {
        records.push("Thriller");
        records.push("Back in Black");
        records.push("The Bodyguard");
        records.push("The Dark Side of the Moon");
        records.push("Their Greatest Hits (1971-1975)");
        records.push("Hotel California");
        records.push("Come On Over");
        records.push("Rumours");
        records.push("Saturday Night Fever");
        for (uint i = 0; i < records.length; i++) {
            approvedRecords[records[i]] = true;
        }
    }

    function getApprovedRecords() public view returns (string[] memory) {
        // return a list of keys from approvedRecords
        string[] memory approvedList = new string[](records.length);
        for(uint i = 0; i < records.length; i++) {
            approvedList[i] = records[i];
        }
        return approvedList;
    }

    function addRecord(string memory _recordName) public {
        if (approvedRecords[_recordName] == false) { revert NotApproved(_recordName); } //default is false
        if (userFavorites[msg.sender][_recordName] == true) { revert AlreadyAdded(_recordName); } //default is false
        userFavorites[msg.sender][_recordName] = true;
        accountFavoritesCount[msg.sender] += 1;
    }

    function getUserFavorites(address _address) public view returns (string[] memory) {
        string[] memory specificUserFavorites = new string[](accountFavoritesCount[_address]);
        uint64 j = 0;
        for(uint i = 0; i < records.length; i++) {
            if (userFavorites[_address][records[i]]) {
                specificUserFavorites[j] = records[i];
                j++;
            }
        }
        return specificUserFavorites;
    }

    function resetUserFavorites() public {
        for (uint i = 0; i < records.length; i++) {
            userFavorites[msg.sender][records[i]] = false;
        }
        accountFavoritesCount[msg.sender] = 0;
    }
}