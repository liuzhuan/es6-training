function h(z) {
    console.log(new Error().stack);
}

function g(y) {
    h(y + 1);
}

function f(x) {
    g(x + 1);
}

f(3);
return;