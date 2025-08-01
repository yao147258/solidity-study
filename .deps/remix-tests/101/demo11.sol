// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Ownable {
    address public owner;

    // 再部署合约的时候传入地址
    constructor(address initOnwer) {
        owner = initOnwer;
    }

    // 定义modifier
    modifier onlyOwner() {
        // 检查调用者的地址是否为onwer，否则抛出异常
        require(msg.sender == owner);
        // 如果是的话继续执行函数体
        _;
    }

    // 函数使用自定义modifier修饰，限制函数调用地址只能是owner
    
    function changeOnwer(address newOnwer) external onlyOwner {
        owner = newOnwer;
    }
}
