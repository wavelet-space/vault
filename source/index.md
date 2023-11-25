```{include} ../README.md
:relative-images:
```

```{toctree}
:maxdepth: 3
:caption: Memoirs
:hidden:
:glob:

memoirs/computers/index
memoirs/equations/index
memoirs/hobbies/index
memoirs/reports/index
memoirs/other/index
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

## Queue

*Here are some current random thoughts. Either it will be abandoned or finished. and moved to the appropriate place.*

- I'm just trying to implement parser combinators in Python.
Some time ago, I needed to parse huge XML. I have implemented a class.
For this, it works, but it is a little bit rubbish. We will see if the parser combinator
can help me improve my parser.
- I have just realized how modern C++20 is similar to Python. I plan to write a few articles to
compare C++ and Python side by side, namely generators, asynchronous execution, and type systems.
- I am working on a personal [catalog](./memoirs/references.md).
- Don't abuse Python dictionary as data structure. Use `dataclass` or `namedtuple`.
- Python namespace package  is very underated feature.

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
    See a dedicated [document](alltalk.md).
  
  where languages marked bold are for production and other for hobyy projects (may change depending on my job).

- Create a list of acronyms used in my notes e.g. TBD (To Be Done) etc.