# Proxy 和 Reflection API

[Proxies and the Reflection API](https://github.com/nzakas/understandinges6/blob/master/manuscript/12-Proxies-and-Reflection.md), by *Nicholas C. Zakas*, from Understanding ES6

ES5 和 ES6 都致力于揭秘 JavaScript。比如，ES5 之前，JavaScript 环境存在不可枚举和不可写的对象属性，但是开发者无法自定义不可枚举和不可写的属性。ES5 使用 `Object.defineProperty()` 赋予开发者新能力。

ES6 向开发者提供了更多能力，这些能力以前只有引擎内部可以使用，通过 `proxies` 暴露出来。Proxy 是一层包装对象，可以截取并改变 JavaScript 引擎的底层操作。

## 数组的问题

在 ES6 之前，开发者无法模拟数组的一些行为：

```js
let colors = ['red', 'green', 'blue']
console.log(colors.length)

colors[3] = 'black'
console.log(colors.length)

colors.length = 2
console.log(colors[3]) // => undefined
```

## 什么是 Proxies 和 Reflection？

可以通过 `new Proxy()` 创建一个 proxy 代替另一个对象（称作 *target*）。proxy 虚拟化了 *target*，因此对于使用 proxy 的一方，proxy 和 target 是一样的。

Proxies 允许开发者拦截 JavaScript 引擎的底层操作，这些拦截通过“陷阱” *trap* 实现。陷阱是应对某些特定操作的函数。

`Reflect` 对象代表的 reflection API，是一个函数集合，提供了相同底层操作的默认行为，可以被 proxies 覆盖。每个 proxy 陷阱都有一个 `Reflect` 函数。这些函数拥有和 proxy 陷阱相同名称，并传入相同的参数。

下表对这些行为做总结

| Proxy 陷阱                 | 覆盖的行为                                                   | 默认行为                             |
| -------------------------- | ------------------------------------------------------------ | ------------------------------------ |
| `get`                      | 读取属性值                                                   | `Reflect.get()`                      |
| `set`                      | 写属性                                                       | `Reflect.set()`                      |
| `has`                      | `in` 操作符                                                  | `Reflect.has()`                      |
| `deleteProperty`           | `delete` 操作符                                              | `Reflect.deleteProperty()`           |
| `getPrototypeOf`           | `Object.getPrototypeOf()`                                    | `Reflect.getPropertyOf()`            |
| `setPrototypeOf`           | `Object.setPrototypeOf()`                                    | `Reflect.setPrototypeOf()`           |
| `isExtensible`             | `Object.isExtensible()`                                      | `Reflect.isExtensible()`             |
| `preventExtensions`        | `Object.preventExtensions()`                                 | `Reflect.preventExtensions()`        |
| `getOwnPropertyDescriptor` | `Object.getOwnPropertyDescriptor()`                          | `Reflect.getOwnPropertyDescriptor()` |
| `defineProperty`           | `Object.defineProperty()`                                    | `Reflect.defineProperty()`           |
| `ownKeys`                  | `Object.keys`, `Object.getOwnPropertyNames()`, `Object.getOwnPropertySymbols()` | `Reflect.ownKeys()`                  |
| `apply`                    | 调用函数                                                     | `Reflect.apply()`                    |
| `construct`                | 使用 `new` 调用函数                                          | `Reflect.construct()`                |

## 创建一个简单 Proxy

```js
let target = {}
// var p = new Proxy(target, handler)
let proxy = new Proxy(target, {})

proxy.name = 'proxy'
console.log(proxy.name) // 'proxy'
console.log(target.name) // 'proxy'

target.name = 'target'
console.log(proxy.name) // 'target'
console.log(target.name) // 'target'
```

## 使用 `set` 陷阱校验属性

`set` 陷阱接收四个参数：

1. `trapTarget` proxy 的目标对象
2. `key` 写入属性的键值（string 或 symbol）
3. `value` 写入属性的值
4. `receiver` 操作发生的对象（通常指 proxy 本身）

`Reflect.set()` 是 `set` 操作的默认行为。如果属性设置正确，陷阱返回 `true`，反之返回 `false`。

```js
let target = {
    name: 'target'
}

let proxy = new Proxy(target, {
    set(trapTarget, key, value, receiver) {
        // ignore existing properties so as not to affect them
        if (!trapTarget.hasOwnProperty(key)) {
            if (isNaN(value)) {
                throw new TypeError('property must be a number')
            }
        }
        return Reflect.set(trapTarget, key, value, receiver)
    }
})

proxy.count = 1
proxy.name = 'proxy'

// throws an error
proxy.anotherName = 'proxy'
```

## 使用 `get` 陷阱校验对象形状

对象形状（*object shape*）是一个对象包含的属性和方法的集合，引擎使用对象形状优化代码。如果你可以确定对象属性一直不变（强制使用 `Object.preventExtensions()`, `Object.seal()` 或 `Object.seal()` ），可以在属性无法访问时抛出异常。

`get` 陷阱拥有三个形参：

1. `trapTarget`
2. `key`
3. `receiver`

```js
let proxy = new Proxy({}, {
    get(trapTarget, key, receiver) {
        if (!(key in receiver)) {
            throw new TypeError('Property ' + key + ' doesn\'t exist.')
        }
        
        return Reflect.get(trapTarget, key, receiver)
    }
})

proxy.name = 'proxy'

console.log(proxy.nme) // throws error
```

在本例中，使用 `receiver` 代替 `trapTarget`，是为了防止 proxy 定义了 `has` 陷阱，从而导致返回结果是错误的。

To Be Continued