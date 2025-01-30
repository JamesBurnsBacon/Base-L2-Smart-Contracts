// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract UnburnableToken {
    // errors
    error AllTokensClaimed();
    error TokensClaimed();
    error UnsafeTransfer(address _to);
    // vars
    mapping(address => uint) public balances;
    mapping(address => bool) public claimers;
    uint public totalSupply;
    uint public totalClaimed;

    constructor() {
        totalSupply = 100000000;
    }

    function claim() public {
        if (totalClaimed >= totalSupply) { revert AllTokensClaimed(); }
        if (claimers[msg.sender] ) { revert TokensClaimed(); }

        balances[msg.sender] += 1000;
        claimers[msg.sender] = true;
        totalClaimed += 1000;
    }

    function safeTransfer(address _to, uint _amount) public {
        if (_to == address(0)) { revert UnsafeTransfer(_to); }
        if (_to.balance == 0) { revert UnsafeTransfer(_to); } //separated from above line for gas savings
        if (balances[msg.sender] < _amount) { revert UnsafeTransfer(_to); }

        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
}