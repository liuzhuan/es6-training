# for-of 循环

`for-of` 是 ES6 引入的新循环，用来替换 `for-in` 和 `forEach()` ，并且支持新的 iteration 协议。

可以使用它遍历 `iterable` 对象（数组，字符串，Maps, Sets 等）:

```javascript
const iterable = ['a', 'b']
for (const x of iterable) {
    console.log(x)
}
// Output:
// a
// b
```

`break` 和 `continue` 在 `for-of` 循环中正常运行：

```javascript
for (const x of ['a', '', 'b']) {
    if (x.length === 0) break;
    console.log(x)
}
```

可以利用 `Array.prototype.entries()` 和解构访问数组的下标和元素值：

```javascript
const arr = ['a', 'b']
for (const [index, element] of arr.entries()) {
  console.log(`${index} = ${element}`)
}
```

遍历 Map 的例子如下:

```javascript
const map = new Map([
  [false, 'no'],
  [true, 'yes'],
])
for (const [key, value] of map) {
  console.log(`${key} => ${value}`)
}
```

## 注意事项

`for-of` 只能用于 iterable 类型。

## References
- [The for-of loop | exploringjs.com](http://exploringjs.com/es6/ch_for-of.html) - Dr. Axel Rauschmayer