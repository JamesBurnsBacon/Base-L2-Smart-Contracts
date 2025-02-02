// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract AdvancedStorage {
    // register -> anybody to register by providing address and age
    mapping(address => uint8) public ages; //public scope provides getter

    function register(uint8 age) external returns(bool) {
        ages[msg.sender] = age; //mapping key to value
        return true;
    }
}

