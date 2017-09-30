# Babel

Babel 首页上有如下介绍：

> Babel is a JavaScript compiler. <br/>Use next generation JavaScript, today.

Babel 是一个 JS 编译器，让未来 JS 立即可用。

## 安装配置

安装 Babel CLI 和预设配置

```shell
npm install --save-dev babel-cli babel-preset-env
```

创建一个 `.babelrc` 文件（或者使用你的 package.json）

```json
{
    "presets": ["env"]
}
```

## Polyfill

Babel 只转换语法（比如箭头函数），如果你需要使用 `Promise` 或 `String.padStart` 等新增全局变量或全局属性，你需要使用 babel-polyfill。

安装方式如下：

```shell
npm install --save-dev babel-polyfill
```

在应用程序入口处引入它即可使用。

## JSX 和 Flow

Babel 可以转换 JSX 语法，去除类型标注。可以查看 [React preset]()

## References

- [Babel 入门教程](http://www.ruanyifeng.com/blog/2016/01/babel.html) - 阮一峰, 2016/01/25
- [Babel - The compiler for writing next generation JavaScript](https://babeljs.io/) - babeljs.io
- [React preset - Babel](https://babeljs.io/docs/plugins/preset-react/) - babeljs.io