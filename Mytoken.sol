// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    string public tokenName;
    string public tokenAbbreviation;
    uint public totalSupply;
    mapping(address => uint) balances;

    constructor(string memory _tokenName, string memory _tokenAbbreviation, uint _initialSupply) {
        tokenName = _tokenName;
        tokenAbbreviation = _tokenAbbreviation;
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply;
    }

    function mint(address account, uint value) public {
        totalSupply += value;
        balances[account] += value;
    }

    function burn(address account, uint value) public {
        require(balances[account] >= value, "Insufficient balance");
        totalSupply -= value;
        balances[account] -= value;
    }

    function balanceOf(address account) public view returns (uint) {
        return balances[account];
    }
}
