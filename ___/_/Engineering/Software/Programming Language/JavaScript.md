# JS Frontend Notes

## ES6 Moduly 

Použití modulů na frontendu (backendu).

### Export modulu

### Import modulu

#### Cross Origin problémy

Práce s moduly na frontendu může přinést problémy s Cross Origin v Chrome.
Nesnažší je pustit lokálně server:

    python -m http.server 8080

### Odkazy

- http://exploringjs.com/
- https://hacks.mozilla.org/2018/03/es-modules-a-cartoon-deep-dive/

# Tipy pro vývoj JS

Firefox obsahyhe ScratchPad... minimalistický editor a debugger!
https://developer.mozilla.org/en-US/docs/Tools/Scratchpad

Knihovny:

React (UI knihovna)
Flux 
Flow (silně typovaný JS)
NodeJS
http://bower.io/
http://www.chartjs.org/docs/#getting-started-include-chart.js

NW (Node WebKit)
http://stackoverflow.com/questions/29944526/how-do-you-correctly-import-react-into-a-node-webkit-app

Tento článek představuje JS regexp engine v interpreteru V8 a srovnává ho s jinými implementacemi.
http://blog.chromium.org/2009/02/irregexp-google-chromes-new-regexp.html

JavaScritp nabízí několik způsobů jak vytvořit gunkci.

## 1. Deklarace funkce

    function fun() {
        console.log("I'am a function!");
    }

## 2. Function expression
    var fun = function() {
        console.log("I'am a function!");
        throw Error("Ooops!");
    };


## 3. Named function expression

    var fun = function  fun_() {
        console.log("I'am a function!");
        throw Error("Ooops!");
    };

    try {
        fun();
    }
    catch(e) {
        console.log(e.stack);
    }

## 4. Named function expression with postfix

