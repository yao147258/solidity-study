// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 导入Strings库合约
import "@openzeppelin/contracts/utils/Strings.sol";

// 库合约：是一系列函数的集合
// 与普通合约主要存在以前几点区别：
// 1. 不能存在状态变量
// 2. 不能继承或被继承
// 3. 不能接收以太币
// 4. 不能被销毁
// 如果库合约的函数被设置为public和external,那么在调用的时候会触发一次delegatecall
// 设置为internal的函数调用不会引起delegatecall，设置为private的函数只能在库合约内部调用

contract Library {
    // 1. 使用usring A for B指令使用库合约函数,添加完指令后，库A中的函数会自动添加为B类型变量的成员，可以直接调用
    // 将Strings中的函数添加到uint256类型的变量上,uint256变量可以直接调用Strings库中的函数
    using Strings for uint256;

    function toHexString1(uint256 _number) public pure returns (string memory) {
        // 库合约中的函数会自动添加为uint256型变量的成员
        return _number.toHexString();
    }

    // 2. 不使用usring for指令，直接通过库合约名调用
    function toHexString2(uint256 _number) public pure returns (string memory) {
        return Strings.toHexString(_number);
    }
}
