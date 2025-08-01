// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// receive()和fallback()回调函数，他们主要在这两种情况下被调用
// 1. 合约接收eth
// 2. 处理合约中不存在的函数调用(代理合约)
contract GetEth {
    // receive()函数在合约接收eth时被调用，不需要使用function修饰，没有任何参数，不返回任何值，必须使用external、payable修饰
    // receive最好不要执行太多的逻辑，因为在使用send、transfer方法发送eth时，gas会限制在2300，如果receice太复杂会出现Out of Gas报错,如果用call就可以自定义gas执行更复杂的逻辑

    event Received(address sender, uint256 amount);

    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    // fallback()会在调用不存在的函数时触发,可用于接收eth，也可以用于代理合约，不需要使用function修饰，没有任何参数，不返回任何值，必须使用external修饰，一般也使用payable修饰
    event FallbackCalled(address Sender, uint256 Value, bytes Data);

    fallback() external payable {
        emit FallbackCalled(msg.sender, msg.value, msg.data);
    }

    // receive和fallback的区别
    // receive和fallback都能够用于接收ETH，他们触发的规则如下：
//    触发fallback() 还是 receive()?
//           接收ETH
//             |
//         msg.data是空？
//           /  \
//          是    否
//          /      \
//receive()存在?   fallback()
//        / \
//       是  否
//      /     \
//receive()   fallback()
}
