# Class

## 关键词

`class`, `constructor`, `extends`, `super`

## 背景知识

JavaScript 语言中，生成实例对象的传统方法是通过构造函数。下面是一个例子。

```javascript
function Point(x, y) {
  this.x = x;
  this.y = y;
}

Point.prototype.toString = function () {
  return '(' + this.x + ', ' + this.y + ')';
};

var p = new Point(1, 2);
```

基本上，ES6 的 `class` 可以看作只是一个语法糖，它的绝大部分功能，ES5 都可以做到，新的class写法只是让对象原型的写法更加清晰、更像面向对象编程的语法而已。上面的代码用 ES6 的class改写，就是下面这样。

```javascript
class Point {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }

  toString() {
    return '(' + this.x + ', ' + this.y + ')';
  }
}
```

## 参考文献
- [Classes - Exploring ES6](http://exploringjs.com/es6/ch_classes.html)
- [Class 的基本用法 - 阮一峰](http://es6.ruanyifeng.com/#docs/class)
- [Class 的继承 - 阮一峰](http://es6.ruanyifeng.com/#docs/class-extends)