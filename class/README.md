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

## 语法糖

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

注意，定义“类”的方法的时候，前面不需要加上 `function` 这个关键字，直接把函数定义放进去了就可以了。另外，方法之间不需要逗号分隔，加了会报错。

ES6 的类，完全可以看作构造函数的另一种写法。

```javascript
class Point {
  // ...
}

typeof Point // "function"
Point === Point.prototype.constructor // true
```

## 不可枚举的方法

类的内部所有定义的方法，都是不可枚举的（non-enumerable）。

```javascript
class Point {
  constructor(x, y) {
    // ...
  }

  toString() {
    // ...
  }
}

Object.keys(Point.prototype)
// []
Object.getOwnPropertyNames(Point.prototype)
// ["constructor","toString"]
```

## 严格模式

类和模块的内部，默认就是严格模式，所以不需要使用 `use strict` 指定运行模式。**只要你的代码写在类或模块之中，就只有严格模式可用。**

考虑到未来所有的代码，其实都是运行在模块之中，所以 ES6 实际上把整个语言升级到了严格模式。

## 不存在变量提升

类不存在变量提升（`hoist`），这一点与 ES5 完全不同。

```javascript
new Foo(); // ReferenceError
class Foo {}
```

## Class 的取值函数（getter）和存值函数（setter）

与 ES5 一样，在“类”的内部可以使用 `get` 和 `set` 关键字，对某个属性设置存值函数和取值函数，拦截该属性的存取行为。

```javascript
class People {
  constructor(name) {
    this.name = name;
    this._age = 0;
  }
  get age() {
    return `${this.name}'s age: ${this._age}`;
  }
  set age(value) {
    if (value < 0) {
      throw new Error('invalid age: should not be less than zero')
    }

    this._age = value
  }
}

const ironMan = new People('Stark');

ironMan.age = 42;
console.log(ironMan.age);
ironMan.age = -1;
console.log(ironMan.age);
```

## Class 的静态方法

类相当于实例的原型，所有在类中定义的方法，都会被实例继承。如果在一个方法前，加上 `static` 关键字，就表示该方法不会被实例继承，而是直接通过类来调用，这就称为“静态方法”。

```javascript
class Foo {
  static classMethod() {
    return 'hello';
  }
}

Foo.classMethod() // 'hello'

var foo = new Foo();
foo.classMethod()
// TypeError: foo.classMethod is not a function
```

如果静态方法包含this关键字，这个this指的是类，而不是实例。

```javascript
class Foo {
  static bar () {
    this.baz();
  }
  static baz () {
    console.log('hello');
  }
  baz () {
    console.log('world');
  }
}

Foo.bar() // hello
```

父类的静态方法，可以被子类继承。

```javascript
class Foo {
  static classMethod() {
    return 'hello';
  }
}

class Bar extends Foo {
}

Bar.classMethod() // 'hello'
```

## Class 的静态属性和实例属性

静态属性指的是 Class 本身的属性，即 `Class.propName`，而不是定义在实例对象（this）上的属性。

```javascript
class Foo {
}

Foo.prop = 1;
Foo.prop // 1
```

上面的写法为Foo类定义了一个静态属性prop。

目前，只有这种写法可行，因为 **ES6 明确规定，Class 内部只有静态方法，没有静态属性**。

## extends 继承

Class 可以通过 `extends` 关键字实现继承，这比 ES5 的通过修改原型链实现继承，要清晰和方便很多。

```javascript
class HelloMessage extends React.Component {
  render() {
    return <div>Hello {this.props.name}</div>;
  }
}
```

子类必须在 `constructor` 方法中调用 `super` 方法，否则新建实例时会报错。这是因为子类没有自己的`this` 对象，而是继承父类的 `this` 对象，然后对其进行加工。如果不调用 `super` 方法，子类就得不到`this` 对象。

## 参考文献
- [Classes - Exploring ES6](http://exploringjs.com/es6/ch_classes.html)
- [Class 的基本用法 - 阮一峰](http://es6.ruanyifeng.com/#docs/class)
- [Class 的继承 - 阮一峰](http://es6.ruanyifeng.com/#docs/class-extends)