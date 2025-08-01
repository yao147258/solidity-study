// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 函数
contract FunctionType {
    // 定义一个状态变量
    uint256 public number = 0;

    // 定义一个函数，每次调用number+1
    function add() external {
        number = number + 1;
    }

    // internal定义的函数只能在合约内部调用
    function minus() internal {
        number = number - 1;
    }

    // external定义的函数可以在合约外部调用，这样间接调用内部方法
    function minusOnExtrnal() external {
        minus();
    }

    // payable定义函数，调用时需要向合约支付gas，并返回合约余额
    function minusPayable() external payable returns (uint256 balance) {
        minus();
        // this关键字引用合约的地址
        balance = address(this).balance;
    }
}
