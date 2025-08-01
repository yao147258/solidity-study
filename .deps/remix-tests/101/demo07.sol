// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 映射类型规则
// 1. 映射的key只能是solidity内置的类型（uint、address等），不能是结构体类型
// 2. 映射的存储位置必须是storage，因此可以用于合约的状态变量，和函数内部的storage变量，不能用于函数的入参和出参
// 3. 如果映射声明为public类型，那么solidity会自动创建一个getter方法，可以通过key来获取value
// 4. 给映射增加键值对的语法为：map[key] = value
contract Map {
    // 定义映射类型，key是uint类型，value是address类型
    mapping(uint256 => address) public map;

    function putAddress(uint256 _key, address _address) public {
        map[_key] = _address;
    }
}
