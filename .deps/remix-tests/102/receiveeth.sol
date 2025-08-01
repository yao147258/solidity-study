// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 接收ETH的合约
contract ReceiveETH {
    event Log(uint256 value, uint256 balance);

    receive() external payable {
        // 记录收到的eth数量和eth余额
        emit Log(msg.value, gasleft());
    }

    // 查询合约余额
    function queryBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
