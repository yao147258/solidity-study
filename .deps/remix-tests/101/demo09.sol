// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 常量在初始化后，不能修改值，更加安全和节省gas
// 1. constant: 变量必须在声明的时候初始化值，之后不能修改
// 2. immutable: immutable声明的常量可以在声明时或者构造函数中初始化，只有数值类型能声明为immutable常量，另外immutable可以使用函数或者全局变量来初始化
contract Constant {
    uint256 constant number1 = 1;
    bool constant flag1 = true;

    uint256 immutable number2;
    address immutable address1 = address(this);

    // 在合约的构造函数中给immutable常量赋值
    constructor() {
        number2 = 2;
    }
}
