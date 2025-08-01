// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 抽象合约至少包含一个抽象方法，抽象方法必须使用virtual修饰，等待子合约实现
abstract contract Sorter {
    function sort(uint256[] memory array)
        public
        pure
        virtual
        returns (uint256[] memory);
}

contract BubbleSorter is Sorter {
    function sort(uint256[] memory array)
        public
        pure
        override
        returns (uint256[] memory)
    {
        for (uint256 i = 0; i < array.length - 1; i++) {
            for (uint256 j = 0; j < array.length - i - 1; j++) {
                if (array[j] > array[j + 1]) {
                    uint256 temp = array[j + 1];
                    array[j + 1] = array[j];
                    array[j] = temp;
                }
            }
        }
        return array;
    }
}


