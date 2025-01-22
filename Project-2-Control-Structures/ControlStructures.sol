// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "hardhat/console.sol";

contract ControlStructures {
    error AfterHours(uint _time);
    function fizzBuzz(uint _number) external pure returns(string memory) {
        if(_number % 3 == 0 && _number % 5 == 0) {
            return "FizzBuzz";
        } else if(_number % 5 == 0) {
            return "Buzz";
        } else if(_number % 3 == 0) {
            return "Fizz";
        } else {
            return "Splat"; 
        } //for code readability not nesting ifs, the most gas eff function would not use && and would nest ifs
    }
    function doNotDisturb(uint _time) external pure returns(string memory) {
        assert(_time < 2400); //asserts used for testing internal errors, time must be less than 2400
        if(_time > 2200 || _time < 800) { revert AfterHours(_time); }
        if( _time >= 1200 && _time <= 1259) { revert("At lunch!"); } //legacy pattern

        if(_time >= 800 && _time <= 1199) {
            return "Morning!";
        } else if(_time >= 1300 && _time <= 1799) {
            return "Afternoon!";
        } else {
            return "Evening!"; //saving a bit of gas because all other valid cases have been handled
        }        
    }
}
