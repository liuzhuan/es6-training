# Iterator 和 for-of 循环

## Iterator （遍历器）

JavaScript 原有的表示“集合”的数据结构，主要是数组（Array）和对象（Object），ES6 又添加了 Map 和 Set。这样就有了四种数据集合，用户还可以组合使用它们，定义自己的数据结构，比如数组的成员是 Map，Map 的成员是对象。这样就需要一种统一的接口机制，来处理所有不同的数据结构。

遍历器（Iterator）就是这样一种机制。它是一种接口，为各种不同的数据结构提供统一的访问机制。任何数据结构只要部署 Iterator 接口，就可以完成遍历操作（即依次处理该数据结构的所有成员）。

Iterator 的作用有三个：

1. 为各种数据结构，提供一个统一的、简便的访问接口
2. 使得数据结构的成员能够按某种次序排列
3. ES6 创造了一种新的遍历命令 `for...of` 循环，Iterator 接口主要供 `for...of` 消费

遍历器有一个 `next()` 方法，用来移动指针。开始时，指针指向数组的开始位置。然后，每次调用 `next()` 方法，指针就会指向数组的下一个成员。

如果使用 TypeScript 的写法，遍历器接口（Iterable）、指针对象（Iterator）和 next 方法返回值的规格可以描述如下。

```ts
interface Iterable {
  [Symbol.iterator]() : Iterator,
}

interface Iterator {
  next(value?: any) : IterationResult,
}

interface IterationResult {
  value: any,
  done: boolean,
}
```

一种数据结构只要部署了 Iterator 接口，我们就称这种数据结构是”可遍历的“（iterable）。

ES6 规定，默认的 Iterator 接口部署在数据结构的 `Symbol.iterator` 属性，或者说，一个数据结构只要具有`Symbol.iterator` 属性，就可以认为是“可遍历的”（iterable）。

## for..of 循环

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
- [Iterator 和 for...of 循环](http://es6.ruanyifeng.com/#docs/iterator) -  阮一峰