// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 调用其他合约
// 使用_Name(_Address)来创建合约的引用,然后使用_Name(_Address).f()来调用合约的函数
contract CallOtherContract {

    function callSetX(address to, uint256 x) public {
        OtherContract(to).setX(x);
    }
}

// 被调用的合约
contract OtherContract {
    uint256 private _x = 0; // 状态变量_x
    // 收到eth的事件，记录amount和gas
    event Log(uint256 amount, uint256 gas);

    // 返回合约ETH余额
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // 可以调整状态变量_x的函数，并且可以往合约转ETH (payable)
    function setX(uint256 x) external payable {
        _x = x;
        // 如果转入ETH，则释放Log事件
        if (msg.value > 0) {
            emit Log(msg.value, gasleft());
        }
    }

    // 读取_x
    function getX() external view returns (uint256 x) {
        x = _x;
    }
}