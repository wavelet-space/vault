```{include} ../README.md
:relative-images:
```

```{toctree}
:maxdepth: 3
:caption: Memoirs
:hidden:
:glob:

memoirs/computing/index
memoirs/equations/index
memoirs/hobbies/index
memoirs/reports/index
memoirs/various/index
memoirs/*
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

personal/resume
personal/projects
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

<div style="text-align: center; font-size: 1.5rem; font-weight: bold">Queue</div>

*Here are some current random thoughts. Either it will be abandoned or finished, and moved to the appropriate place.*

- I'm just trying to implement parser combinators in Python.
  Some time ago, I needed to parse huge XML. I have implemented a class.
  For this, it works, but it is a little bit rubbish. We will see if the parser combinator
  can help me improve my parser.
- How can one be open and share all one's thoughts and still maintain a certain kind of distance and inaccessibility?
- I have just realized how modern C++20 is similar to Python. I plan to write a few articles to
compare C++ and Python side by side, namely generators, asynchronous execution, and type systems.
- I am working on a personal [catalog](./memoirs/references.md).
- Don't abuse Python dictionary as data structure. Use `dataclass` or `namedtuple`. Write some examples for myself and my coworkers.
- Python namespace package  is very underated feature.
- Software design and programming are more about linguistics than mathematics. Even pure algorithmic or math problems suffer from bad naming.
- Some topics which I wanted to explore in the past will explore more in-depth in 2024: *dynamical and complex systems, game theory, optimal control theory, catastrophe theory, pattern formation, phase transitions, Geometric algebra for computer graphics and Lie groups*
- Bibliography and references: At this moment I use combination of BibTex and custom manually edited list [here](./memoirs/references.md). There are movies, games, books, articles (printed, online) and YouTube videos and channels. I need to resolve this mess. See also <https://en.wikipedia.org/wiki/Template:Cite_AV_media>
- Write work notes (journals or reports) on a weekly basis, not on a daily basis. To have a hundred files for each day is annoying. Most of the tasks are done on a weekly basis + squash all daily notes.
- Migrating form `.rst` to MyST `.md`. Using Pandoc for that e.g. `pandoc .\file.rst -f rst -t markdown -o file.md`.
- I have lost a lot of time playing with too many programming languages. I have decided to deepen my knowledge only in these areas:
  - **C++** and, in some sense, also in C (abandoned Rust; it is too overhyped and rigid; Zig and Jai are far more interesting)
  - **Python** (R is too messy; Julia looks promising, but it cannot compete with Python in versatility)
  - Fortran (Julia again, but modern Fortran really looks good)
  - **Erlang** (hidden gem of concurrent and networked programming, Elixir is nice but I prefer Prolog-like syntax of Erlang)
  - OCaml v5 and Lean v4 (I will never understand why Haskell is so overhyped)
  - APL and a whole family of *array oriented languages* e.g K, Q and Dyalog APL
  - Forth and a whole family of *stack oriented languages* (I am working on a custom implementation; as everyone)
  - **JavaScript** (I really hate TypeScript—not a type system at all but this classy, csharped IAmInterface mess)
  - Go (I really don't like Go, but it is too practical and at the same time too ugly)
  - Smalltalk: Squak is good enough; In the past I emailed autor of some very intersting implementation. He was kind and
    replayed with some tips. He was also geophysicist working on simulations with his own Smalltalk implementation &ndash; very interesting!
    See a dedicated [document](./memoirs/computing/alltalk.md).
  - Scala is nice, especially Scala 3, but job offers are too limited. Again, when somebody will pay mo for that
    I will use it, put Python seems to be good enough.
  
  The languages marked bold are for production and other for hobby projects (this may change depending on context).

- Create a list of acronyms used in my notes e.g. TBD (To Be Done) etc.
- I don't like CVs. They are misleading, obsolete, or both.
- I need a grammar checker for code and writing in general. Both the Czech and English spell checkers can be used in GHA, but how do I incorporate them into VS Code?
- Write these to konwledge-base
  - What is the difference between TCP and UDP?
  - What part does an HTTP message contain?
  - What is a URN URL?
  - What is the difference between stdin, stdout and stderr?
  - What is the difference between unit, functional and integration tests?
- Read Tabular Expressions in Software Engineering
  <https://www.semanticscholar.org/paper/Tabular-Expressions-in-Software-Engineering-Wassyng-Janicki/750fecf4349faeeab9a827a929de37be30f3df26?p2df>
- <https://www.southwales.ac.uk/news/news-for-2023/jurassic-park-at-30-how-its-cgi-revolutionised-the-film-industry/>
- ComboBox vs SelectBox?
  - <https://cs.wikipedia.org/wiki/Kombinovan%C3%A9_pole>
- Add a note to Python konowledge base:
  - `tempfile` built-in module
  - `asyncio` built-in module
  - `threading` built-in module
  - `multiprocessing` built-in module
  - When to use `__new__` vs `__init__`
- Use [asciinema](https://asciinema.org/) for README showcases and tutorials.
- Use pipx?
- AbortController? <https://developer.mozilla.org/en-US/docs/Web/API/AbortController>
- Context usage in Go?
- Distributed systems
  - CAP theorem
  - eventual consitency
  - Service Oriented Architecture (SOA)
  - Cloud computing

- It has bee shown that getting a good night sleep is more significant than the programming language choice (https://youtu.be/7qdpMvv_Qag?t=1043) :D

- Using https://github.com/mgaitan/sphinxcontrib-mermaid