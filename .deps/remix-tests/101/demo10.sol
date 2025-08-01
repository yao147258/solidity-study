// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 控制流
contract ControlFlow {
    // 1. if-else
    function isZero(uint256 number) public pure returns (bool) {
        if (number == 0) {
            return true;
        } else {
            return false;
        }
    }

    // 2. for
    function sumNumberFor(uint256 number) public pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 1; i <= number; i++) {
            sum += i;
        }
        return sum;
    }

    // 3. while
    function sumNumberWhile(uint256 number) public pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 1;
        while (i <= number) {
            sum += i;
            i++;
        }
        return sum;
    }

    // 4. do-while
    function sumNumberDoWhile(uint256 number) public pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 1;
        do {
            sum += i;
            i++;
        } while (i <= number);
        return sum;
    }

    // 5. 三元运算符
    function threeOprate(int256 number) public pure returns (bool) {
        return number >= 0 ? true : false;
    }

    // 插入排序示例 - 错误版
    // 在一下代码中，j有可能取到-1，uint类型最小值为0，会报错
    function insertionSortWrongError(uint256[] memory a)
        public
        pure
        returns (uint256[] memory)
    {
        for (uint256 i = 1; i < a.length; i++) {
            uint256 temp = a[i];
            uint256 j = i - 1;
            while ((j >= 0) && (temp < a[j])) {
                a[j + 1] = a[j];
                j--;
            }
            a[j + 1] = temp;
        }
        return (a);
    }

    // 插入排序示例 - 正确版
    // 在一下代码中，j有可能取到-1，uint类型最小值为0，会报错
    function insertionSortWrongSuccess(uint256[] memory a)
        public
        pure
        returns (uint256[] memory)
    {
        for (uint256 i = 1; i < a.length; i++) {
            uint256 temp = a[i];
            uint256 j = i;
            while (j >= 1 && (temp < a[j - 1])) {
                a[j] = a[j - 1];
                j--;
            }
            a[j] = temp;
        }
        return (a);
    }
}
