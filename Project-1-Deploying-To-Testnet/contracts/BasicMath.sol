// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

// storage keyword cannot be used for func params, it is reserved for state variables that reference data on the blockchain
// memory keyword is used for vars that exist temporarily during function execution
contract BasicMath {
    function adder(uint _a, uint _b) external pure returns (uint, bool) {
        bool error = false;
        unchecked { 
            uint sum = _a + _b; 
            if(sum < _a || sum < _b) { 
                error = true; 
                sum = 0; } 
            return (sum, error); 
        }
    }
        function subtractor(uint _a, uint _b) external pure returns (uint, bool) {
        bool error = false;
        unchecked { 
            uint difference = _a - _b;
            if(difference > _a) { 
                error = true; 
                difference = 0; }
            return (difference, error);
        }    
    }
}