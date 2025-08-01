// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 变量初始值，在solidity中，声明但是没有赋值的变量都有初始值
// 1. boolean: false
// 2. string: ""
// 3. int: 0
// 4. uint: 0
// 5. enum: 枚举中的第一个元素
// 6. address: 0x0000000000000000000000000000000000000000
// 7. 静态数组: 例如uint[3]: [0,0,0]
// 8. 动态数组: 例如uint[] : []

// delete操作符，会让变量的值变为初始值
contract InitValue {
    bool public flag = true;

    function deleteFlag() public {
        delete flag;
    }
}
