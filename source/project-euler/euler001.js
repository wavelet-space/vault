/* 
 * https://projecteuler.net/problem=1
 * execution: `$ node euler1.js`
 */

function euler1() {
    var sum = 0;
    for (var i = 3; i < 1000; ++i) {
        if (i % 3 === 0 || i % 5 === 0) {
            sum += i;
        }
    }
    return sum;
}

console.log(euler1());
