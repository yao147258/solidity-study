// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 数据类型
contract DataType {
    // 1. 布尔类型
    bool public _flag1 = true;
    bool public _flag2 = _flag1 && false;
    bool public _flag3 = _flag1 || false;
    bool public _flag4 = !_flag1;

    // 2. 整型
    // 整型
    int256 public _number1 = 1;
    // 无符号整型
    uint256 public _number2 = 1;
    // 无符号256位整型
    uint256 public _number3 = 20250312;

    int256 public _number4 = 1 + 1;
    int256 public _number5 = 1 - 1;
    int256 public _number6 = 1 * 1;
    int256 public _number7 = 1 / 1;
    int256 public _number8 = 1 % 1;
    // 幂
    int256 public _number9 = 2**3;

    // 3. 地址类型
    // 普通地址类型
    address public _address = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    // payable 地址类型，可以转账，查询余额，并且提供了2个成员方法transfer、send用于接收和转账
    address payable public _payable_address = payable(_address);
    // 查余额
    uint256 public _balance = _payable_address.balance;

    // 4. 数组类型
    // 定长字节数组，最多存储32位数据(bytes1、bytes8、bytes32)
    // MiniSolidity转换为16进制是 0x4d696e69536f6c69646974790000000000000000000000000000000000000000
    bytes32 public _byte = "MiniSolidity";
    // _byte[0]代表第一个字节，即 0x4d
    bytes1 public _byte1 = _byte[0];

    // 5. 枚举类型
    // 枚举
    enum AccessModel {
        Buy,
        Hold,
        Sell
    }
    // 创建enum变量 action
    AccessModel buy = AccessModel.Buy;
    // enum可以和uint显式的转换
    function enumToUint() external view returns (uint256) {
        return uint256(buy);
    }

}
