// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 引用类型
contract ReferenceType {
    // 1. 数组
    // 1.1 固定长度数组
    uint256[3] array1;
    bytes[3] array2;
    address[3] array3;

    // 1.2 可变长度数组
    uint256[] array4;
    bytes1[] array5;
    address[] array6;
    // bytes比较特殊，是数组，不需要使用[]来声明，bytes比bytes1[]更省gas
    bytes array7;

    // 数组的创建规则，对于memroy修饰的动态数组，可以使用new关键字来创建
    function fArray() public payable returns (uint256[] memory) {
        uint256[] memory array8 = new uint256[](1);
        array8[0] = 1;
        array8[1] = 2;
        return array8;
    }

    // 数组成员
    // 1. length:数组的长度，memroy修饰的数组在创建后length是固定的
    // 2. push():动态数组的成员，向数组的最后添加一个0，并返回该元素的引用
    // 3. push(x):动态数组的成员，向数组的最后添加一个x，并返回该元素的引用
    // 4. pop():动态数组的成员，删除数组的最后一个元素

    // 2. 结构体
    struct Student {
        uint256 id;
        string name;
        uint256 score;
    }
    // 创建一个结构体实例
    Student public student;

    // 给结构体实例赋值
    function fStudent() external {
        student.id = 1;
        student.name = "yfq";
        student.score = 99;
    }

    // 使用构造函数赋值
    function initStudent() external {
        student = Student(1, "yfq", 98);
    }

    // 使用key-value构造函数赋值
    function keyStudent() external {
        student = Student({id: 1, name: "yfq", score: 97});
    }
}
