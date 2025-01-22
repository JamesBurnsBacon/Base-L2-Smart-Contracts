// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "hardhat/console.sol";

contract ControlStructuresExamples {
    error InvalidNumber(); //custom error

    function isTheFirstNumberBigger(uint _n1, uint _n2) external pure returns(bool) {
        // require(_n1 > 0 && _n2 > 0, "Invalid input"); // but custom errors consume less gas than require, newer feature
        if(_n1 < 0 && _n2 < 0){
            revert InvalidNumber();
        }

        if(_n1 > _n2){
            return true;
        } else if(_n1 < _n2) {
            return false;
        } else {
            return false; //this is just a silly example, I would use fewer lines of code to save gas in a real contract
        }
    }

    function loop() pure external {
        //for(init; condition; increment)
        for(uint index = 0; index < 8; index++) {
            //logger
            console.log("the index is ", index);

            if(index == 2) {
                console.log("Index is 2");
                continue;
            }
            console.log("Index != 2");

            if(index == 4) {
                console.log("Index is 4");
                break;
            }
            console.log("End of loop");
        }
    }
}