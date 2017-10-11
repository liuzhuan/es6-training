# Async 函数

async 函数有如下形式：

- 函数声明：  `async function foo() {};`
- 函数表达式： `const foo = async function() {};`
- 方法定义：  `let obj = { async foo() {} };`
- 箭头函数：  `const foo = async () => {};`

## await

`await` 操作符用来等待 `Promise`。只能在 `async 函数` 中使用。用法如下：

```javascript
[rv] = await expression
```

其中，`expression` 是一个 `Promise` 对象或等待的任何数值。`rv` 是 `Promise` 成功后的固定值或者其他数值本身（当 `expression` 不是 `Promise` 类型时）。

## References

- [Async functions](http://exploringjs.com/es2016-es2017/ch_async-functions.html) - Dr. Axel Rauschmayer
- [async 函数](http://es6.ruanyifeng.com/#docs/async) - 阮一峰
- [async functio | mdn](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function)
- [await | mdn](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/await)