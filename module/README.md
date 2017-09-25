# Module

## 关键词

`import`, `export`, `default`, `as`

## 背景

在 ES6 之前，社区制定了一些模块加载方案，最主要的有 `CommonJS` 和 `AMD` 两种。前者用于服务器，后者用于浏览器。ES6 在语言标准的层面上，实现了模块功能，而且实现得相当简单，完全可以取代 `CommonJS` 和 `AMD` 规范，成为浏览器和服务器通用的模块解决方案。

ES6 模块的设计思想，是尽量的静态化，使得编译时就能确定模块的依赖关系，以及输入和输出的变量。

ES6 模块有以下好处。

- 不再需要UMD模块格式了，将来服务器和浏览器都会支持 ES6 模块格式。目前，通过各种工具库，其实已经做到了这一点。
- 将来浏览器的新 API 就能用模块格式提供，不再必须做成全局变量或者 navigator 对象的属性。
- 不再需要对象作为命名空间（比如Math对象），未来这些功能可以通过模块提供。

## 严格模式

ES6 的模块自动采用严格模式，不管你有没有在模块头部加上 `"use strict";`。

## export 命令

模块功能主要由两个命令构成：`export` 和 `import`。`export` 命令用于规定模块的对外接口，`import` 命令用于输入其他模块提供的功能。

```javascript
export const firstName = 'Michael';
export const lastName = 'Jackson';
export const year = 1958;
```

export的写法，除了像上面这样，还有另外一种。

```javascript
var firstName = 'Michael';
var lastName = 'Jackson';
var year = 1958;

export {firstName, lastName, year};
```

应该优先考虑使用这种写法。因为这样就可以在脚本尾部，一眼看清楚输出了哪些变量。

## 动态绑定

`export` 语句输出的接口，与其对应的值是动态绑定关系，即通过该接口，可以取到模块内部实时的值。

```javascript
export var foo = 'bar';
setTimeout(() => foo = 'baz', 500);
```

上面代码输出变量 `foo`，值为 `bar`，500毫秒之后变成 `baz`。

这一点与 CommonJS 规范完全不同。**CommonJS 模块输出的是值的缓存**，不存在动态更新

## 原生的模块化支持

2017年9月15日，Chrome 61 开始支持原生的 ES6 模块，只需使用 `<script type="module">` 嵌入即可。

```html
<script type="module">
  import {addText} from './utils.js';
  addText('Modules are pretty cool.');
</script>
```

```javascript
// utils.js
export function addTextToBody(text) {
  const div = document.createElement('div');
  div.textContent = text;
  document.body.appendChild(div);
}
```

Node.js 8.5.0 开始支持原生的 ES6 模块，不过需要使用 `--experimental-modules`，并且文件后缀必须是 `.mjs`。目前的计划是到 Node.js 10 LTS 才将默认值改为 ES 模块。

## 背景知识

## 浏览器支持情况

## Node.js 支持情况

## http2

## 参考文献
- [Module 的语法 - 阮一峰](http://es6.ruanyifeng.com/#docs/module)
- [ES6 Modules in Depth](https://ponyfoo.com/articles/es6-modules-in-depth) - Nicolás Bevacqua, 2015/09/25
- [New in Chrome 61](https://developers.google.com/web/updates/2017/09/nic61) - Pete LePage, 2017/09/15
- [ECMAScript modules in browsers](https://jakearchibald.com/2017/es-modules-in-browsers/) - Jake Archibald, 2017/05/02
- [Using ES modules natively in Node.js](http://2ality.com/2017/09/native-esm-node.html) - Dr. Axel Rauschmayer, 2017/09/12