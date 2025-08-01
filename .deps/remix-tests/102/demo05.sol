// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 发送eth有三个方法：transfer()、send()、call(),其中call是鼓励用的方法
contract SendETH {
    // 构造函数使用payable修饰可以在部署合约的时候转入ETH
    constructor() payable {}

    function queryBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // 1. transfer
    // transfer方法的最多消耗gas为2300，如果对方的receivce方法或者fallback方法消耗的gas过高会转账失败，触发revert来回滚交易
    function transferETH(uint256 amount, address payable to) external payable {
        // 向to这个合约地址转入amount数量的ETH
        to.transfer(amount);
    }

    // 2. send
    // send方法的最多消耗gas为2300，如果对方的receivce方法或者fallback方法消耗的gas过高会转账失败，但是不会触发revert来回滚交易，需要额外代码来处理
    // send方法会返回一个bool结果，标记转账是否成功
    error SendFailed();

    function sendETH(uint256 amount, address payable to) external payable {
        bool result = to.send(amount);
        if (!result) {
            // 转账失败时revert交易并且发送error
            revert SendFailed();
        }
    }

    // 3. call
    // call方法转账没有gas限制，转账失败不会触发revret，方法会返回(bool, bytes),bool代表成功与否
    error CallFailed();

    function callETH(uint256 amount, address payable to) external payable {
        (bool result, ) = to.call{value: amount}("");
        if (!result) {
            revert CallFailed();
        }
    }
}
