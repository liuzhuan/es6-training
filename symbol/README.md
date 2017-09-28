# Symbol

![SnowFlakes](../assets/snowflakes.jpg)

每片 :snowflake: 都是独一无二的，就像 Symbol。

## 新的原始类型

如果有一种机制，保证每个属性的名字都是独一无二的就好了，这样就从根本上防止属性名的冲突。这就是 ES6 引入 `Symbol` 的原因。

> A symbol value may be used as an identifier for object properties; this is the data type's only purpose.

ES6 引入了一种新的原始数据类型 `Symbol`，表示独一无二的值。它是 JavaScript 语言的第七种数据类型，前六种是：`undefined`、`null`、布尔值（`Boolean`）、字符串（`String`）、数值（`Number`）、对象（`Object`）。

Symbol 值通过 `Symbol` 函数生成。

```javascript
let s = Symbol() // 注意：此处不能有 `new` 命令

typeof s
// "symbol"
```

## 禁止 `new` 命令

因为 `Symbol` 不是构造函数，所以不能使用 `new` 命令。

## 可选字符串作为描述（`description`）

`Symbol` 函数可以接受一个字符串作为参数，表示对 Symbol 实例的描述，主要是为了在控制台显示，或者转为字符串时，比较容易区分。

```javascript
let s1 = Symbol('foo');
let s2 = Symbol('bar');

s1 // Symbol(foo)
s2 // Symbol(bar)

s1.toString() // "Symbol(foo)"
s2.toString() // "Symbol(bar)"
```

## 类型转换

Symbol 值不能与其他类型的值进行运算，会报错。但是可以显示转换为字符串或者布尔值。

```javascript
{
  let sym = Symbol('hello symbol')
    
  "you symbol is " + sym // Uncaught TypeError: Cannot convert a Symbol value to a string
    
  console.log("you symbol is " + String(sym)) 
  console.log("you symbol is " + sym.toString())

  console.log(Boolean(sym)) // true

  if (sym) {
    console.log('sym is true')
  }

  Number(sym) // Uncaught TypeError: Cannot convert a Symbol value to a number
}
```

## 作为属性名

由于每一个 Symbol 值都是不相等的，这意味着 Symbol 值可以作为标识符，用于对象的属性名，就能保证不会出现同名的属性。这对于一个对象由多个模块构成的情况非常有用，能防止某一个键被不小心改写或覆盖。

```javascript
let mySymbol = Symbol()

let a = {}
a[mySymbol] = 'Hello' // 必须放到方括号中

let obj = {
  [mySymbol](arg) { ... } // 简写的函数形式
}

// 定义一些常量
log.levels = {
  DEBUG: Symbol('debug'),
  INFO: Symbol('info'),
  WARN: Symbol('warn')
}

log(log.levels.DEBUG, 'debug message')
```

## 实例：消除魔术字符串

```javascript
const shapeType = {
  triangle: Symbol()
}

function getArea(shape, options) {
  let area = 0;
  switch(shape) {
    case shapeType.triangle:
      area = .5 * options.width * options.height;
      break;
  }
  return area;
}

getArea(shapeType.triangle, { width: 100, height: 100 });
```

## 属性名的遍历

Symbol 作为属性名，该属性不会出现在 `for...in`、`for...of` 循环中，也不会被 `Object.keys()`、`Object.getOwnPropertyNames()`、`JSON.stringify()`返回。但是，它也不是私有属性，有一个 `Object.getOwnPropertySymbols` 方法，可以获取指定对象的所有 Symbol 属性名。

另一个新的 API，`Reflect.ownKeys` 方法可以返回所有类型的键名，包括常规键名和 `Symbol` 键名。

```javascript
let obj = {
  [Symbol('my_key')]: 1,
  enum: 2,
  nonEnum: 3
};

Reflect.ownKeys(obj)
//  ["enum", "nonEnum", Symbol(my_key)]
```

由于以 Symbol 值作为名称的属性，不会被常规方法遍历得到。我们可以利用这个特性，为对象定义一些非私有的、但又希望只用于内部的方法。

```javascript
let size = Symbol('size');

class Collection {
  constructor() {
    this[size] = 0;
  }

  add(item) {
    this[this[size]] = item;
    this[size]++;
  }

  static sizeOf(instance) {
    return instance[size];
  }
}

let x = new Collection();
Collection.sizeOf(x) // 0

x.add('foo');
Collection.sizeOf(x) // 1

Object.keys(x) // ['0']
Object.getOwnPropertyNames(x) // ['0']
Object.getOwnPropertySymbols(x) // [Symbol(size)]
```

## `Symbol.for()`，`Symbol().keyFor()`

有时，我们希望重新使用同一个 Symbol 值，`Symbol.for()` 方法可以做到这一点。它接受一个字符串作为参数，然后搜索有没有以该参数作为名称的 Symbol 值。如果有，就返回这个 Symbol 值，否则就新建并返回一个以该字符串为名称的 Symbol 值。

```javascript
let s1 = Symbol.for('foo');
let s2 = Symbol.for('foo');

s1 === s2 // true
```

`Symbol.for()` 与 `Symbol()` 这两种写法，都会生成新的 `Symbol`。它们的区别是，前者会被登记在全局环境中供搜索，后者不会；前者会**尽量复用全局环境中存在的变量**，符合共享经济的理念，但后者**每次都会产生新的变量**，相当浪费。

`Symbol.keyFor` 方法返回一个已登记的 Symbol 类型值的 key。

```javascript
let s1 = Symbol.for("foo");
Symbol.keyFor(s1) // "foo"

let s2 = Symbol("foo");
Symbol.keyFor(s2) // undefined
```

## 内置的 Symbol 值

除了定义自己使用的 Symbol 值以外，ES6 还提供了 11 个内置的 Symbol 值，指向语言内部使用的方法。

- `Symbol.hasInstance`
- `Symbol.isConcatSpreadable`: 表示该对象用于 `Array.prototype.concat()` 时，是否可以展开。
- `Symbol.species`: 指向当前对象的构造函数
- `Symbol.match`: 对象的 `Symbol.match` 属性，指向一个函数。当执行 `str.match(myObject)` 时，如果该属性存在，会调用它，返回该方法的返回值。
- `Symbol.replacef`
- `Symbol.search`
- `Symbol.split`
- `Symbol.iterator`: 对象的 `Symbol.iterator` 属性，指向该对象的默认遍历器方法
- `Symbol.toPrimitive`
- `Symbol.toStringTag`
- `Symbol.unscopables`

## 总结 

获取 Symbol 的三种方式

1. 使用 `Symbol()`。独一无二
2. 使用 `Symbol.for(string)`。全局共享。
3. 使用标准定义的“著名” Symbol 变量，比如：`Symbol.iterator`。特殊用途。

## Reference

- [Symbol](http://es6.ruanyifeng.com/#docs/symbol) - 阮一峰
- [ES6 Symbols in Depth](https://ponyfoo.com/articles/es6-symbols-in-depth) - Nicolás Bevacqua, 2015/09/09
- [Symbols](http://exploringjs.com/es6/ch_symbols.html) - Axel Rauschmayer
- [Symbol](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol) - MDN
- [ES6 In Depth: Symbols](https://hacks.mozilla.org/2015/06/es6-in-depth-symbols/) - Jason Orendorff, 2015/06/11