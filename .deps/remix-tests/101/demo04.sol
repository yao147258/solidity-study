// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract FunctionRetures {
    // 1. 匿名返回参数，需要使用return返回
    function method1()
        public
        pure
        returns (
            uint256,
            bool,
            uint256[3] memory
        )
    {
        return (1, false, [uint256(1), 2, 3]);
    }

    // 2. 命名返回参数，可以直接对参数赋值，自动返回
    function method2()
        public
        pure
        returns (
            uint256 number,
            bool flag,
            uint256[3] memory array
        )
    {
        number = 1;
        flag = true;
        array = [uint256(1), 2, 3];
    }

    // 3. 函数返回值的解构
    function getReturn() public pure {
        // 3.1 全部解构
        uint256 _number;
        bool _flag;
        uint256[3] memory _array;
        (_number, _flag, _array) = method2();

        // 3.2 部分解构
        bool _flag2;
        (, _flag2, ) = method2();
    }
}
