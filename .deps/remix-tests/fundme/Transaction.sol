// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Transaction {
    // 账户信息
    mapping(address => uint256) accountMap;

    // 存钱
    function saveMoney() public payable {
        require(msg.value > 0, "Value must be than zero.");

        accountMap[msg.sender] = msg.value;
    }

    // 取钱
    function getMoney() public {
        // 1. 获取账户余额
        uint256 balance = accountMap[msg.sender];
        require(balance > 0, "The account balance is insufficient.");

        // 2. 使用transfer转账
        payable(msg.sender).transfer(balance);
    }

    function queryMoney() public view returns (uint256) {
        return accountMap[msg.sender];
    }
}
