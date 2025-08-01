// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Scope {
    // 数据位置存储类型有三种
    // 1. storage:存储在链上，消耗gas高，合约里的状态变量默认都是存储在storage上
    // 2. memroy:存储在内存中，不上链，消耗gas低于storage，函数的参数、返回值、局部变量都是存储在memroy
    // 3. calldata:与memroy类似，存储在内存中，不上链，消耗gas低于storage，与memroy不同的是，calldata修饰的变量不能修改，主要用于函数的参数
    function fCallData(uint256[] calldata array)
        public
        pure
        returns (uint256[] calldata)
    {
        // 参数array使用calldata修饰，如果修改会编译错误
        // array[0] = 1;
        return array;
    }

    // 合约里的状态变量在赋值给函数里的storage变量时，变化会被同步
    // 其他情况赋值创建的是本体的副本，修改副本的值，如果不将新值赋值回本体，那么数据不会同步，例如将storage数据赋值给函数里的memroy变量
    uint256[] public storageArray = [1, 2, 3];

    function fStorage() public {
        uint256[] storage tempArray = storageArray;
        // 修改函数里的变量值，合约里的状态变量会受影响
        tempArray[0] = 10;
    }

    // function fMemroy() public {
    //     uint256[] memory tempArray2 = storageArray;
    //     // 修改函数里的变量值，合约里的状态变量不会受影响
    //     tempArray2[0] = 10;
    // }

    // 变量的作用域分为三种
    // 1. 状态变量:存储在链上，消耗gas高，在合约内部、函数外部声明的成员变量，合约的所有函数都可以访问
    // 2. 局部变量:函数内部声明的变量，存储在memroy中，消耗gas低
    // 3. 全局变量:全局可直接访问的变量，都是solidity预留关键字,在函数内部不用声明，直接使用
    function global()
        public
        view
        returns (
            address,
            uint256,
            bytes memory
        )
    {
        // 请求发起的地址
        address sender = msg.sender;
        // 当前区块高度
        uint256 blockNum = block.number;
        // 请求数据
        bytes memory data = msg.data;
        return (sender, blockNum, data);
    }

    // 4. 全部变量-以太单位和时间单位

    // 4.1 以太单位：
    // 4.1.1 wei:1
    // 4.1.2 gwei:1e9
    // 4.1.3 ether:1e18
    function getWei() public pure returns (uint256) {
        return 1 wei;
    }

    function getGwei() public pure returns (uint256) {
        return 1 gwei;
    }

    function getEther() public pure returns (uint256) {
        return 1 ether;
    }

    // 4.2 时间单位：可以在合约中规定一个操作必须在一周内完成，或者某个事件在一个月后发生。这样就能让合约的执行可以更加精确，不会因为技术上的误差而影响合约的结果
    // 4.2.1 seconds:1
    // 4.2.2 minutes:60
    // 4.2.3 hours:3600
    // 4.2.4 days:86400
    // 4.2.5 weeks:604800
    function getSeconds() public pure returns (uint256) {
        return 1 seconds;
    }

    function getMinutes() public pure returns (uint256) {
        return 1 minutes;
    }

    function getHours() public pure returns (uint256) {
        return 1 hours;
    }

    function getDay() public pure returns (uint256) {
        return 1 days;
    }

    function getWeeks() public pure returns (uint256) {
        return 1 weeks;
    }
}
