// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 使用字节码方式来调用其他合约里的方法
contract CallerContract {
    event Response(bool success, bytes data);

    constructor() payable {}

    function callSetX(address payable to, uint256 x) public payable {
        // call setx，同时发送eth
        (bool success, bytes memory data) = to.call{value: msg.value}(
            abi.encodeWithSignature("setX(uint256 x)", x)
        );

        emit Response(success, data);
    }

    function callGetX(address payable to) public returns (uint256) {
        (bool success, bytes memory data) = to.call(
            abi.encodeWithSignature("getX()")
        );

        emit Response(success, data);
        return abi.decode(data, (uint256));
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

// 被调用合约
contract CallableContract {
    uint256 private _x = 0; // 状态变量x
    // 收到eth的事件，记录amount和gas
    event Log(uint256 amount, uint256 gas);

    fallback() external payable {}

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

    // 读取x
    function getX() external view returns (uint256 x) {
        x = _x;
    }
}
