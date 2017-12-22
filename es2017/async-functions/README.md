# Async 函数

`async 函数` 由 Brian Terlson 提出。

async 函数有如下形式：

- 函数声明：  `async function foo() {};`
- 函数表达式： `const foo = async function() {};`
- 方法定义：  `let obj = { async foo() {} };`
- 箭头函数：  `const foo = async () => {};`

async 函数总会返回 Promise 实例。

```javascript
/** 返回一个 fulfilling 实例 */
async function asyncFunc() {
  return 123;
}

asyncFunc()
  .then(x => console.log(x))

/** 返回一个 rejecting 实例 */
async function asyncFunc() {
  throw new Error('Problem!')
}

asyncFunc()
  .catch(err => console.log(err))
```

## await

`await` 操作符可等待 `Promise`，其只能在 `async` 函数内使用。用法如下：

```javascript
[rv] = await expression
```

其中，`expression` 是 `Promise` 对象或任何数值。`rv` 是 `Promise` 成功后的固定值或者其他数值本身（当 `expression` 不是 `Promise` 类型时）。

## References

- [Async functions](http://exploringjs.com/es2016-es2017/ch_async-functions.html) - Dr. Axel Rauschmayer
- [async 函数](http://es6.ruanyifeng.com/#docs/async) - 阮一峰
- [async functio | mdn](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function)
- [await | mdn](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/await)
- [Understanding JavaScript's async await | ponyfoo.com](https://ponyfoo.com/articles/understanding-javascript-async-await) - Nicolás Bevacqua, 2016/02/04