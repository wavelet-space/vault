# Currying/Schönfinkelization

> *Currying* (též *Schönfinkelization*) je proces, kdy z funkce o *n* parametrech vytvoříme 

Názorně `f(x, y)` převedeme na  `f1(x)f2(x)`

např `f(x, y) => x + y` na `g(x) => (h(y) => x + y)`.

    g(1) vrací anonymní funkci h(y) => 1 + x
    g(1)(1) => vrací 2

    f(x, y, z) =>  x * y  + 2z

```fsharp
let add x y = x + y
```

Představme si že máme jazyk, který umožňuje vytvářet jen funkce, které přebírají pouze jeden parametr. Tak je ostatně definována matematocká funkce.
Naštěstí náš jazyk umožnuje vracet funkci jako návratovu hodnotu. Jak můžeme simulovat funkce, které přebírají více parametrů, jak je známe z jazyků jakp C++?

Lambda Calculus definuje funkce, které přebírají jen jden parametr.
Funkce s více parametry jsou vlastně funkce, které přebírají n-tici, ale 
jak Moses Schönfinkel a Haskell Curry dokázali, stačí nám uvažovat funkci jen s jedním parametrem, protože více paramterů se dá simulovat.

http://stackoverflow.com/a/1352865/2490538

První co potřebujeme zjistit je počet argumentů funkce, kterou předáváme jako parametr, tzv. *arita* funkce. V JS je funkce objekt, navíc tzv. *array-like* objekt, protože má vlastnost `length` a právě pomocí ní, zjistíme její aritu.

```js
let f = (a, b) => a + b;

function curry(func) {
  if (typeof func != "function") {
    throw "Not a function!";
  }
  const arity = func.length;
  
  return (() => { 
      let args = Array.prototype.slice.call(arguments);
      //console.log(args.length);
    })(); 
    
}

let a  = curry(f)

```



## F\#




# Partial application 

`Function#bind`

```js
function add(a, b) {
  return a + b; 
}

var add5 = add.bind(null, 5);

add5(5); // => 10
```




