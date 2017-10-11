# 函数参数列表的末尾逗号

末尾逗号现在合法了：

```javascript
function foo(
    param1,
    param2,
) {}

foo(
    'abc',
    'def',
)
```

好处有两个：

1. 交换参数顺序更轻松
2. 便于版本控制软件显示**真正的改动**，避免增删逗号的干扰。

## References
- [Trailing commas in function parameter lists and calls | exploringjs.com](http://exploringjs.com/es2016-es2017/ch_trailing-comma-parameters.html) - Dr. Axel Rauschmayer