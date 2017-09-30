import 'babel-polyfill'

const p = new Promise((resolve, reject) => {
    setTimeout(resolve, 1000, 'done')
})