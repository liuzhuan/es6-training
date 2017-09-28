# 编程风格

![Style Guide](../../assets/style-guide.jpg)

## 目的

写出合理的、易于阅读和维护的代码。因为代码是给人看的。

不整洁的代码给人的感觉如下图：

![Chaos Cabel](../../assets/chaos.jpg)

整洁的代码看[这里](https://www.buzzfeed.com/lukebailey/satisfying-cables?utm_term=.ryzeoaRen#.ltYZkaPZx)

## 常见规则

- 避免使用 `var`, 尽可能使用 `const`
- 如果无法使用 `const`, 使用 `let`
- 尽可能使用对象简写形式
- 字符串使用单引号或反引号
- 使用 `...` 拷贝数组
- 立即执行函数使用箭头函数的形式

[Airbnb 中文版](https://github.com/sivan/javascript-style-guide/blob/master/es5/README.md)

## EditorConfig

![EditorConfig](../../assets/editorconfig.png)

EditorConfig 帮助开发人员在不同的编辑器和 IDE 中保持一致的编码风格。

比如：[vue/.editorconfig](https://github.com/vuejs/vue/blob/dev/.editorconfig)

```
# http://editorconfig.org

root = true

[*]
charset = utf-8
indent_style = space
indent_size = 2
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true

[*.md]
insert_final_newline = false
trim_trailing_whitespace = false
```

## ESLint

ESLint 是一个语法规则和代码风格的检查工具，可以用来保证写出语法正确、风格统一的代码。

首先，安装ESLint。

```
$ npm install eslint --save-dev
```

然后，初始化配置文件：

```
$ ./node_modules/.bin/eslint --init
```

现在就可以检查，当前项目的代码是否符合预设的规则。

```
$ ./node_modules/.bin/eslint yourfile.js
```

## 代码质量

![wtfm](../../assets/wtfm.jpg)

> 检验代码质量的唯一标准：脏口次数/每分钟

## 参考文献
- [编程风格 - 阮一峰](http://es6.ruanyifeng.com/#docs/style)
- [Airbnb JavaScript Style Guide](https://github.com/airbnb/javascript)
- [Coding style tips for ECMAScript 6](http://exploringjs.com/es6/ch_coding-style.html)
- [Why Coding Style Matters?](https://www.smashingmagazine.com/2012/10/why-coding-style-matters/) - Nicholas C. Zakas, 2012/10/25
- [EditorConfig](http://editorconfig.org/)
- [ESLint](https://eslint.org/)
  - [Getting Started with ESLint - ESLint](https://eslint.org/docs/user-guide/getting-started)
  - [Rules](https://eslint.org/docs/rules/)
- [23 Photos That Will Make Anyone Who Works In IT Satisfied](https://www.buzzfeed.com/lukebailey/satisfying-cables?utm_term=.ryzeoaRen#.ltYZkaPZx) - Luke Bailey, 2016/01/20
- [WTFs/m](http://www.osnews.com/story/19266/WTFs_m) - Thom Holwerda, 2008/02/04