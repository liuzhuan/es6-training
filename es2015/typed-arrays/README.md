# 类型数组

`ArrayBuffer` 对象、`TypedArray` 视图和 `DataView` 视图是 JavaScript 操作二进制数据的一个接口。这些对象早就存在，属于独立的规格（2011年2月发布），ES6 将它们纳入了 ECMAScript 规格，并且增加了新的方法。它们都是以数组的语法处理二进制数据，所以统称为**二进制数组**。

这个接口的原始设计目的，与 WebGL 项目有关。所谓 WebGL，就是指浏览器与显卡之间的通信接口，为了满足 JavaScript 与显卡之间大量的、实时的数据交换，它们之间的数据通信必须是二进制的，而不能是传统的文本格式。

二进制数组由三类对象组成

1. `ArrayBuffer` 对象：代表内存之中的一段二进制数据，可以通过“视图”进行操作。“视图”部署了数组接口，这意味着，可以用数组的方法操作内存。

2. `TypedArray` 视图：共包括 9 种类型的视图，比如 `Uint8Array`（无符号8位整数）数组视图, `Int16Array`（16位整数）数组视图, `Float32Array`（32位浮点数）数组视图等等。

3. `DataView` 视图：可以自定义复合格式的视图，比如第一个字节是 `Uint8`（无符号8位整数）、第二、三个字节是 `Int16`（16位整数）、第四个字节开始是 `Float32`（32位浮点数）等等，此外还可以自定义字节序。

简单说，`ArrayBuffer` 对象代表原始的二进制数据，`TypedArray` 视图用来读写简单类型的二进制数据，`DataView` 视图用来读写复杂类型的二进制数据。

`TypedArray` 视图支持的数据类型一共有 9 种（`DataView` 视图支持除 `Uint8C` 以外的其他8种）。

| 数据类型 | 字节长度 | 含义 | 对应的 C 语言类型 |
| --- | --- | --- | --- |
| Int8 | 1 | 8 位带符号整数 | signed char |
| Uint8 | 1 | 8 位不带符号整数 | unsigned char |
| Uint8C | 1 | 8 位不带符号整数<br/>（自动过滤溢出） | unsigned char |
| Int16 | 2 | 16 位带符号整数 | short |
| Uint16 | 2 | 16 位不带符号整数 | unsigned short |
| Int32 | 4 | 32 位带符号整数 | int |
| Uint32 | 4 | 32 位不带符号整数 | unsigned int |
| Float32 | 4 | 32 位浮点数 | float |
| Float64 | 8 | 64 位浮点数 | double |

注意，二进制数组并不是真正的数组，而是类似数组的对象。

## ArrayBuffer 对象

`ArrayBuffer` 对象代表储存二进制数据的一段内存，它不能直接读写，只能通过视图（`TypedArray` 视图和 `DataView` 视图)来读写，视图的作用是以指定格式解读二进制数据。

`ArrayBuffer` 也是一个构造函数，可以分配一段可以存放数据的连续内存区域。

```js
const buf = new ArrayBuffer(32);
```

未完待续...

## References

- [Typed Arrays | exploringjs.com](http://exploringjs.com/es6/ch_typed-arrays.html) - Dr. Axel Rauschmayer
- [ArrayBuffer](http://es6.ruanyifeng.com/#docs/arraybuffer) - 阮一峰