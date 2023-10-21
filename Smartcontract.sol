// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MetaMaskInteraction {

    address public owner;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
    }

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function getBalance(address account) public view returns (uint256) {
        return balances[account];
    }

    function withdraw(uint256 amount) external {
        require(amount <= balances[msg.sender], "Insufficient balance");
        payable(msg.sender).transfer(amount);
        balances[msg.sender] -= amount;
    }
}
