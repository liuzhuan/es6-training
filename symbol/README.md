# Symbol

## 新的原始类型

如果有一种机制，保证每个属性的名字都是独一无二的就好了，这样就从根本上防止属性名的冲突。这就是 ES6 引入 `Symbol` 的原因。

ES6 引入了一种新的原始数据类型 `Symbol`，表示独一无二的值。它是 JavaScript 语言的第七种数据类型，前六种是：`undefined`、`null`、布尔值（`Boolean`）、字符串（`String`）、数值（`Number`）、对象（`Object`）。

Symbol 值通过 `Symbol` 函数生成。

```javascript
let s = Symbol() // 注意：此处不能有 `new` 命令

typeof s
// "symbol"
```

## 禁止 `new` 命令

因为 `Symbol` 不是构造函数，所以不能使用 `new` 命令。

## 可选字符串作为参数

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

## Reference

- [Symbol](http://es6.ruanyifeng.com/#docs/symbol) - 阮一峰
- [ES6 Symbols in Depth](https://ponyfoo.com/articles/es6-symbols-in-depth) - Nicolás Bevacqua, 2015/09/09
- [Symbols](http://exploringjs.com/es6/ch_symbols.html) - Axel Rauschmayer