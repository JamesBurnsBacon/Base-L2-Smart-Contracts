// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract EmployeeStorage {
    uint shares = 1000;
    string name = "Pat";
    uint salary = 50000;
    uint idNumber = 112358132134;
    function viewSalary() external returns(uint) {
    
    }
    function viewShares() external returns(uint) {

    }
    function grantShares(uint _newShares) public {

    }
    /**
    * Do not modify this function.  It is used to enable the unit test for this pin
    * to check whether or not you have configured your storage variables to make
    * use of packing.
    *
    * If you wish to cheat, simply modify this function to always return `0`
    * I'm not your boss ¯\_(ツ)_/¯
    *
    * Fair warning though, if you do cheat, it will be on the blockchain having been
    * deployed by your wallet....FOREVER!
    */
    function checkForPacking(uint _slot) public view returns (uint r) {
        assembly {
            r := sload (_slot)
        }
    }

    /**
    * Warning: Anyone can use this function at any time!
    */
    function debugResetShares() public {
        shares = 1000;
    }
}
