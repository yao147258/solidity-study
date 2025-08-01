// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 事件是EVM上的抽象日志，具有2个特点
// 1. 响应：应用程序可用通过RPC接口订阅和监听事件，并在前端做响应
// 2. 经济：每个消耗大概2000gas，在链上存储一个新变量至少需要20000gas
contract Event {
    // 定义映射来存储每个地址的余额数量
    mapping(address => uint256) balanceMapping;

    // 定义名为Transfer的事件
    // from代表转账地址，to代表接收地址，value代表转账数量
    // from、to前面使用indexed修饰，他们会保存在以太坊虚拟机的topics中，方便之后检索
    event Transfer(address indexed from, address indexed to, uint256 value);

    // 函数里释放事件
    function taransfer(
        address from,
        address to,
        uint256 amount
    ) external {
        // 给转账地址一些初始余额
        balanceMapping[from] = 1000000000;

        // balanceMapping[from] = balanceMapping[from] - amount;
        // balanceMapping[to] = balanceMapping[to] + amount;

        balanceMapping[from] -= amount;
        balanceMapping[to] = amount;

        // 释放事件
        emit Transfer(from, to, amount);
    }
}
