# Projects

Some project in a very bad shape. Needs more love. Should be script generated.

- [c16](https://github.com/groundf/c16) Python programming language examples and exercises.
- [c06](https://github.com/groundf/c06) The Fortran programming language course.
- [c03](https://github.com/groundf/c03) The C and C++ programming labguages course (+ some ASM)
- [c08](https://github.com/groundf/c08) Functional programming: Erlang, OCaml, Lean, Haskell

```{raw} html
<script type="text/javascript" defer>
        window.onload = function() {

            let states = {
                "gear1": 1,
                "gear2": 1,
                "gear3": 3,
            }  

            function animate(key, speed) {
                states[key] = states[key] + speed;
                
                document.getElementById(key).style.transform = 
                    `rotate(${states[key]}deg)`;

                requestAnimationFrame(() => {
                    animate(key, speed);
                });

            }

            for (const [key, value] of Object.entries(states)) {
                requestAnimationFrame(function () {
                    animate(key, value);
                });
            } 
        }
</script>
<div class="eyes">
    <svg width="200" height="200" id="gear1">
        <circle cx="75" cy="75" r="50" />
        <circle cx="55" cy="55" r="20" fill="white"/>
    </svg>
    <svg width="200" height="200" id="gear2">
        <circle cx="75" cy="75" r="50" />
        <circle cx="55" cy="55" r="20" fill="white"/>
    </svg>
</div>
```