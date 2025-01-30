// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MinimalToken {
    mapping(address => uint) public balances; // stores address of token holder => balance
    uint public totalSupply;

    constructor() {
        totalSupply = 3000;
        balances[msg.sender] = totalSupply / 3;

        balances[0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2] = totalSupply / 3;

        balances[0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db] = totalSupply / 3;
    }

    function transfer(address _to, uint _amount) external {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
}