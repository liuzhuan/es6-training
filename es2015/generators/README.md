# Generator 生成器

## 关键词

`function *`, `yield`

## 简介

Generator 函数是 ES6 提供的一种异步编程解决方案，语法行为与传统函数完全不同。

从语法上，首先可以把它理解成，Generator 函数是一个状态机，封装了多个内部状态。

执行 Generator 函数会返回一个遍历器对象，返回的遍历器对象，可以依次遍历 Generator 函数内部的每一个状态。

形式上，Generator 函数是一个普通函数，但是有两个特征。一是，`function` 关键字与函数名之间有一个星号；二是，函数体内部使用 `yield` 表达式，定义不同的内部状态。

```js
function* helloWorldGenerator() {
  yield 'hello';
  yield 'world';
  return 'ending';
}

var hw = helloWorldGenerator();
```

Generator 函数的调用方法与普通函数一样，也是在函数名后面加上一对圆括号。不同的是，调用 Generator 函数后，该函数并不执行，返回的也不是函数运行结果，而是**一个指向内部状态的指针对象**，即遍历器对象（Iterator Object）。

下一步，必须调用遍历器对象的 `next()` 方法，使得指针移向下一个状态。Generator 函数是分段执行的，`yield` 表达式是暂停执行的标记，而 `next` 方法可以恢复执行。

## yield 表达式

由于 Generator 函数返回的遍历器对象，只有调用 `next` 方法才会遍历下一个内部状态，所以其实提供了一种可以暂停执行的函数。`yield` 表达式就是暂停标志。

### 惰性求值

需要注意的是，`yield` 表达式后面的表达式，只有当调用 `next` 方法、内部指针指向该语句时才会执行，因此等于为 JavaScript 提供了手动的“惰性求值”（Lazy Evaluation）的语法功能。

```js
function* gen() {
  yield  123 + 456;
}
```

上面代码中，yield 后面的表达式 `123 + 456`，不会立即求值，只会在 `next` 方法将指针移到这一句时，才会求值。

Generator 函数可以不用 yield 表达式，这时就变成了一个单纯的暂缓执行函数。

```js
function* f() {
  console.log('执行了！')
}

var generator = f();

setTimeout(function () {
  generator.next()
}, 2000);
```

`yield` 表达式只能用在 Generator 函数里面，用在其他地方都会报错。

## next 方法的参数

yield 表达式本身没有返回值，或者说总是返回 `undefined`。`next` 方法可以带一个参数，该参数就会被当作上一个 `yield` 表达式的返回值。

这个功能有很重要的语法意义。Generator 函数从暂停状态到恢复运行，它的上下文状态（context）是不变的。通过next方法的参数，就有办法在 Generator 函数开始运行之后，继续向函数体内部注入值。也就是说，**可以在 Generator 函数运行的不同阶段，从外部向内部注入不同的值，从而调整函数行为**。



## References

- [Generator 函数的语法](http://es6.ruanyifeng.com/#docs/generator) - 阮一峰
- [Generator 函数的异步应用](http://es6.ruanyifeng.com/#docs/generator-async) - 阮一峰
- [Generators | exploringjs.com](http://exploringjs.com/es6/ch_generators.html#sec_overview-generators) - Dr. Axel Rauschmayer