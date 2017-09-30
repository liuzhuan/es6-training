# Babel

![Babel](../assets/babel-logo.png)

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

Babel 可以转换 JSX 语法，去除类型标注。

```
npm install --save-dev babel-preset-react
```

然后把 `"react"` 加入到 `.babelrc` 预置数组。

## CLI

编译到标准输出

```
babel script.js
```

将编译结果输出到文件，`--out-file` 或 `-o`

```
babel script.js --out-file script-compiled.js
```

如果要监听文件改变，可以使用 `--watch` 或 `-w` 选项：

```
babel script.js --watch --out-file script-compiled.js
```

如果要使用 **source map 文件**，可以使用 `--source-maps` 或 `-s` 选项：

```
babel script.js --out-file script-compiled.js --source-maps
```

若要使用 **inline source maps**，可使用 `--source-maps inline` 选项：

```
babel script.js --out-file script-compiled.js --source-maps inline
```

将 `src/` 目录编译到 `lib/` 目录，可使用 `--out-dir` 或 `-d` 选项：

```
babel src --out-dir lib
```

如果要将整个目录编译到一个文件，可以使用：

```
babel src --out-file script-compiled.js
```

使用 `--ignore` 忽略特定文件：

```
babel src --out-dir lib --ignore spec.js,test.js
```

使用 `--copy-files` 表示只拷贝，不编译：

```
babel src --out-dir lib --copy-dirs
```

## References

- [Babel 入门教程](http://www.ruanyifeng.com/blog/2016/01/babel.html) - 阮一峰, 2016/01/25
- [Babel - The compiler for writing next generation JavaScript](https://babeljs.io/) - babeljs.io
- [React preset - Babel](https://babeljs.io/docs/plugins/preset-react/) - babeljs.io
- [CLI - Babel](https://babeljs.io/docs/usage/cli/) - babeljs.io