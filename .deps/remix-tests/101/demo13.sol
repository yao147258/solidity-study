// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 定义父类
contract Parent {
    event Log(string msg);

    function printLog(string calldata message) public virtual {
        emit Log(message);
    }
}

// 1. 合约的继承使用is关键字
// 2. 多重继承时，要按照辈份高低从高到低
// 3. 如果一个函数在多个父类里面都存在，那么子类必须重写，并且要再override关键字后面加上所有父合约名字，例如override(Yeye, Baba)
contract Child is Parent {
    function printLog(string calldata message) public virtual override {
        emit Log(message);
    }
}

contract Base1 {
    modifier exactDividedBy2And3(uint256 _a) virtual {
        require(_a % 2 == 0 && _a % 3 == 0);
        _;
    }
}

// 修饰器继承
contract Identifier is Base1 {
    // 子合约可以直接使用父合约的修饰器，也可以使用override重写
    modifier exactDividedBy2And3(uint256 _a) override {
        _;
        require(_a % 2 == 0 && _a % 3 == 0);
    }

    //计算一个数分别被2除和被3除的值，但是传入的参数必须是2和3的倍数
    function getExactDividedBy2And3(uint256 _dividend)
        public
        pure
        exactDividedBy2And3(_dividend)
        returns (uint256, uint256)
    {
        return getExactDividedBy2And3WithoutModifier(_dividend);
    }

    //计算一个数分别被2除和被3除的值
    function getExactDividedBy2And3WithoutModifier(uint256 _dividend)
        public
        pure
        returns (uint256, uint256)
    {
        uint256 div2 = _dividend / 2;
        uint256 div3 = _dividend / 3;
        return (div2, div3);
    }
}

// 构造函数的继承
abstract contract A {
    uint256 public a;

    constructor(uint256 _a) {
        a = _a;
    }
}

contract C is A {
    constructor(uint256 _c) A(_c * _c) {}
}


// 钻石继承
/* 继承树：
  God
 /  \
Adam Eve
 \  /
people
*/

contract God {
    event Log(string message);

    function foo() public virtual {
        emit Log("God.foo called");
    }

    function bar() public virtual {
        emit Log("God.bar called");
    }
}

contract Adam is God {
    function foo() public virtual override {
        emit Log("Adam.foo called");
        super.foo();
    }

    function bar() public virtual override {
        emit Log("Adam.bar called");
        super.bar();
    }
}

contract Eve is God {
    function foo() public virtual override {
        emit Log("Eve.foo called");
        super.foo();
    }

    function bar() public virtual override {
        emit Log("Eve.bar called");
        super.bar();
    }
}

// people中使用super来调用父类方法时，会依次调用Eve、Adam、God的对应方法
contract people is Adam, Eve {
    function foo() public override(Adam, Eve) {
        super.foo();
    }

    function bar() public override(Adam, Eve) {
        super.bar();
    }
}