// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// 三种抛出异常的方法
// 1. error:是0.8.4版本新加的内容，可以方便高效的向用户反馈操作失败的原因，同时还可以在抛出异常时携带参数
// 2. require:在0.8版本之前主流的异常抛出方法，缺点是gas的消耗会随着异常的描述增加而增加,使用方法:require(条件,'异常描述')
// 3. assert:一般用于debug调试程序，不能解释异常抛出的原因
// 三种方式消耗gas:error < assert < require
contract Exception {
    mapping(uint256 => address) onwerMap;

    function transfer1(uint256 tokenId, address newOwner) external {
        // 检查代币的持有人是不是转账的发起人
        if (onwerMap[tokenId] != msg.sender) {
            revert TransferNotOnwer(newOwner);
        }

        onwerMap[tokenId] = newOwner;
    }

    function transfer2(uint256 tokenId, address newOwner) external {
        // 检查代币的持有人是不是转账的发起人
        require(onwerMap[tokenId] == msg.sender, "Transfer Not Owner");

        onwerMap[tokenId] = newOwner;
    }

    function transfer3(uint256 tokenId, address newOwner) external {
        // 检查代币的持有人是不是转账的发起人
        assert(onwerMap[tokenId] == msg.sender);

        onwerMap[tokenId] = newOwner;
    }
}

// 定义TransferNotOnwer类型的error
error TransferNotOnwer(address sender);
