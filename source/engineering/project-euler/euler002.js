/* 
 * https://projecteuler.net/problem=2
 * execution: `$ node euler2.js`
 */

function euler2() {
  var sum = 0;
  var a = 0; 
  var b = 1;
  var t = 0;
  
  while (t < 4000000) {
    t = a + b;
    a = b;
    b = t;
    if (t % 2 === 0)
    sum += t;
    
  }
  return sum;
}

console.log(euler2());