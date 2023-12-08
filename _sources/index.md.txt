```{include} ../README.md
:relative-images:
```

```{toctree}
:maxdepth: 3
:caption: Memoirs
:hidden:

memoirs/computing/index
memoirs/electronics/index
memoirs/equations/index
memoirs/various/index
memoirs/reports/index
memoirs/collection
```

```{toctree}
:caption: Essays 
:titlesonly:
:maxdepth: 3
:hidden:
:glob:

essays/*
```

```{toctree}
:caption: Études 
:titlesonly:
:maxdepth: 3
:hidden:
:glob:

etudes/*
```

```{toctree}
:maxdepth: 3
:caption: Personal
:hidden:
:glob:

personal/projects
personal/resume
```

```{raw} html
<!--
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
<div class="eyes" style="width: 170px; height: 170px; margin: 0 auto">
      <svg width="75" height="75" id="gear1">
        <circle cx="37.5" cy="37.5" r="25" />
        <circle cx="27.5" cy="27.5" r="10" fill="white"/>
      </svg>
      <svg width="75" height="75" id="gear2">
        <circle cx="37.5" cy="37.5" r="25" />
        <circle cx="27.5" cy="27.5" r="10" fill="white"/>
      </svg>
</div>
-->
```

<!-- Elswhere/Distractions: link other people -->
```{include} ./memoirs/reports/index.md
:start-line: 1
```