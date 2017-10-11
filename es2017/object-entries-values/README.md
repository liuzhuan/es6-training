# `Object.entries()` 和 `Object.values()`

## `Object.entries()`

函数签名

```javascript
Object.entries(value: any) : Array<[string, any]>
```

举个例子：

```javascript
let obj = { one: 1, two: 2 }
for (let [k, v] of Object.entries(obj)) {
    console.log(`${k} = ${v}`)
}
// one = 1
// two = 2
```

## `Object.values()`

函数签名

```javascript
Object.values(value: any): Array<any>
```

## References

- [Object.entries() 和 Object.values() | exploringjs.com](http://exploringjs.com/es2016-es2017/ch_object-entries-object-values.html) - Dr. Axel Rauschmayer