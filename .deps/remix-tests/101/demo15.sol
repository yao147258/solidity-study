// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 接口定义规则
// 1. 不能包含状态变量
// 2. 不能包含构造函数
// 3. 所有函数必须是external且不能有函数体
// 4. 不能继承除接口外的其他合约
// 5. 继承接口的非抽象合约必须实现接口的所有方法
interface Person {
    function getFirstName() external pure returns (string memory);

    function getLastName() external pure returns (string memory);
}

contract ManPerson is Person {
    function getFirstName() external pure override returns (string memory) {
        return "Yao";
    }

    function getLastName() external pure override returns (string memory) {
        return "FengQiao";
    }
}