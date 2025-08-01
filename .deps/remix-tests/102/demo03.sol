// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 1. 通过文件相对位置import
import "./a.sol";

// 2. 通过网址引用
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";

// 3. 通过npm目录导入
// import '@openzeppelin/contracts/access/Ownable.sol';

// 4. 通过指定全局符号导入
import {Computer} from "./a.sol";

contract Import {
    using Address for address;
    Computer computer = new Computer();

    function test(uint256 a, uint256 b) external view returns (uint256) {
        return computer.sum(a, b);
    }
}
