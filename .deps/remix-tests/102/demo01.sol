// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 函数重载即名字相同，但是参数类型不同(修饰器不能重载)
contract FunctionOvirried {
    function sayHello() public pure returns (string memory) {
        return "say hello";
    }

    function sayHello(string memory message)
        public
        pure
        returns (string memory)
    {
        return message;
    }
}
