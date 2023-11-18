# Notes

Co mne zajímá:

- Mikroservices a distribuované systémy
- Počítačová grafika a vizualizace
- Domain Driven Design a Event Sourcing
- Vedení projektů, Jak správně zapisovat požadavky - Rules, Facts, Terms
  Dá se toto vůbec formalizovat a pokud ano do jaké míry?
- Simulace, autonomí agenti, agent based modeling
- generativní umění, struktury
- Popularizace přírodních věd
- Evoluce, evoluční teorie, AL Artificial Life
- Statistika, Machine Learning a Deep Neural Networks
- Teorie smyslů, hlavně vize
- Behaviorální aspekty, rozhodování
- Network Theory, složuté a dynamické systémy
- Jak testovat, jak programovat, jak designovat
- NLP a neurobiologie

## AL

<https://douwe.com/projects/artificiallife>
<https://douwe.com/projects/>
<http://www.biota.org/book/chbi/chbi4.htm>

Definition can be:

1. formal
2. casual

Námět na počítačovou hru.
Posytava prochází s lucernou a vržené stíny vytvářejí různé obrazce, díky kterým lze řešit různé úkoly.
nedostatek světla takoé vytváří možnost pro náhle zjevené nebezpečí a budování napětí.

Pro inspiraci se podívej na <https://www.redblobgames.com/articles/visibility/>

TEXT Processing
<https://github.com/topics/handwritten-text-recognition>

- <https://github.com/githubharald/SimpleHTR>
- <https://github.com/githubharald/WordSegmentation>
- <https://thesage21.github.io/handwritten/>

pro vybrání Debug nebo Release verze se bude lišit podle genrátoru.

Visuals Studio umožňuje vytvořit debu a relase až při buildu tj

  cmake --build build --config debug
  cmake --build build --config release

<https://riptutorial.com/cmake/example/7357/switching-between-build-types--e-g--debug-and-release>

Pro Linux musíme specifikovat už při generování

  cmake -DCMAKE_BUILD_TYPE=Debug path/to/source
    cmake -DCMAKE_BUILD_TYPE=Release path/to/source

Pokud vložíme tutuo proměnnou pro windows, vypíše se jen varování:

  CMake Warning:
    Manually-specified variables were not used by the project:

    CMAKE_BUILD_TYPE   

> Java is a great programming language and runtime, contrary to what many haters like to state.
<http://cvberry.com/tech_writings/essays/effective_windows_setup.html>

Podívej se na růná témata na githubu:

<https://github.com/topics/computational-geometry>

DRY Principle for Python Development

Don't write documenmtation in external documents, write it near your code.
Documentation is as vulnerable to be obsolete as far it is form the source of truth -- the code.
Use docomments to both quick test prototypes and examples.
It is more robust a nd convenient to tetst with packages as Pytest but DOctets can stay
at comments as an examples. They are also very near the source code and shos you how tho function, method or class  should be uesed.

If you want to write tutorial for your package write it as a inetractive document in Jupyter.

There is no need for requairements file.
Everythiong can be in setup.py alsi the developlment packages

Install everything what ypur package needs -- dont assume that numopy, pandas will be installed globally!

## Postup zpracování textu

- Vstupní texty převeď z různých formátů např. `.doc` na prostý text.
- Vytvoř tokenizovanoy verzi textu - převeď ho na jednotlivé věty.
- Vytvoř trénovací dokument, co řádek to věta -- pro tweet max 140 znaků.
- Použij NN na třenování modelu
- Generuj text (tweety).

## TODO

Twitter nasadit v pátek.
Stáhnout obsah blogu - ossz2vasz4.wordpress.com

herbivorie = ke potravní specializce na rostlinnou potravu
gramnivorie = je herbivorie se specializací na traviny
je forma grazing (spásání?)

stocky = podsaditý
snout = čenich

hourglass = přesýpací hodiny
hourglass-shaped

chest = hruď

## Daily Hints

## Scala

### sbt  Simple Build Tools

## .NET Core F#/C# development

Create a new F# library project.

    dotnet new -f

Paket
<https://fsprojects.github.io/Paket>

Fake
<https://fake.build/>

xUnit, Expecto, FsCheck

Writing user stories is not an easy task. Here are some articles and books which could help you to start.

- <https://medium.freecodecamp.org/how-and-why-to-write-great-user-stories-f5a110668246>
-  

<http://www.highfivehq.com>

<https://docs.google.com/presentation/d/1n2RlMdmv1p25Xy5thJUhkKGvjtV-dkAIsUXP-AL4ffI/edit#slide=id.g3fb17d6480_0_10>
<https://pbpython.com/notebook-process.html>
<https://github.com/abhat222/Data-Science--Cheat-Sheet/blob/master/Excel/Pivot%20Table.pdf>
<https://www.santafe.edu/news-center/news/can-physics-ideas-apply-paleontology>
<https://github.com/allenai/allennlp/blob/master/allennlp/state_machines/states/grammar_based_state.py>

<https://machine-learning-for-physicists.org/>

<https://github.com/geoalg/prog_ex_sols/tree/master/libgasandbox_no_opt>

## Software for geology

## Software for geophysiscs

<https://github.com/fatiando>

# Articles

## BIOLOGY

### BEHAVIOUR

Sex, social status and physiological stress in primates: the importance of social and glucocorticoid dynamics
<https://royalsocietypublishing.org/doi/full/10.1098/rstb.2014.0103>

Brains, Innovations and Evolution in Birds and Primates
<https://www.karger.com/Article/FullText/76784>

### PROGRAMMING, COMPUTER SCIENCE

## VISUALISATION

The efficacy of stacked bar charts in supporting single-attribute and overall-attribute comparisons
<https://www.sciencedirect.com/science/article/pii/S2468502X18300287>

## Movies

- Gattaca 1997

# Návrhy na výdělečnou činnost

## Vývoj a výzku vě vědách o Zemi

__
\/ GRAD (Geocience Research & Development)

- senzory, měření a lokalizace

## Párování dat

## Zpracování digitálních dat

*Konverze a úprava mediálních souborů.*

    audio, image, video
    analýza, konverze
    image/video
        up/down scaling
        format conversion

    dostupné přes REST/SOCKET API
    scheduled conversions
    batch and streaming

# HALITE: computer graphics engine and realtime renderer, simulator

# Notes & Resources

## Papers to Read

- Hutton G., A tutorial on the universality and expressiveness of fold

## WebDev

- <https://techbootcamp.github.io/book/modules/web-development/api.html>

## A-LIFE

- <https://en.wikipedia.org/wiki/Artificial_life>

## Game Engine

- <https://github.com/lethal-guitar/RigelEngine/tree/master/src/engine>
- <https://vorbrodt.blog/2019/04/13/3d-engine-coordinate-systems/>
- <https://www.cprogramming.com/tutorial/animation/animation_engine_design.html>

## Geometric Algebra

- <https://www.youtube.com/watch?v=ElLl6gzNbFE>
- <https://www.youtube.com/watch?v=VApO4qUgAYY>

## Interactive Visualisations/Simulations

- <https://observablehq.com/@csiz/measurements-of-cell-settling-simulation>
- <https://www.redblobgames.com/maps/mapgen4/>
- <https://www.inkandswitch.com/muse-studio-for-ideas.html>
- <https://www.inkandswitch.com/>
- <https://github.com/mathisonian/awesome-visualization-research>
- <https://zalo.github.io/>
- <https://twitter.com/redblobgames>
- <http://www-cs-students.stanford.edu/~amitp/>

## Primatologie

- <http://pin.primate.wisc.edu/factsheets/entry/gelada_baboon/behav>
- <https://www.pnas.org/content/113/19/E2750>
- <https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3456960/>
- <https://phys.org/news/2019-05-language-comprehension-vocal-production.html>
- <https://link.springer.com/article/10.1007/BF02381450>
- <https://www.nature.com/news/fossils-indicate-common-ancestor-for-two-primate-groups-1.12997>
- <https://en.wikipedia.org/wiki/Catarrhini>
- <https://www.sciencedaily.com/releases/2019/01/190131101030.htm>

## Condensed Matter

- <https://www.sciencedaily.com/releases/2019/05/190523104942.htm>
- <https://www.unibas.ch/en/News-Events/News/Uni-Research/The-geometry-of-an-electron-determined-for-the-first-time.html>

## Neuaral Network

- <https://github.com/google/uis-rnn>

## Linguistics

- <https://cs.wikipedia.org/wiki/Josef_Dobrovsk%C3%BD>

## Chris Marker

- <https://web.ics.purdue.edu/~felluga/jetee.html>
- <http://www2.hawaii.edu/~meidor/art_101/la_jetee.html>

Testing LaTeX

$
\vec{v} = (1, 2, 3)
$

<https://stackoverflow.com/questions/1067226/c-multi-line-macro-do-while0-vs-scope-block>

# ReasonML

<https://github.com/reasonml-community>

# Python

The python compiler <http://nuitka.net/doc/user-manual.html>

## Handy modules and libraries

### Standard Library Modules

- `functools`
  - `partial`

- `itertools`

### Testing

- `pytest`
- `pytest-cov`

## How to

- How to get the filename without the extension from a path?

    3.4+
        from pathlib import Path
        Path("/root/dir/sub/file.ext").stem
    or

        os.path.splitext(os.path.basename("/root/dir/sub/file.ext"))[0]

- What is string template?

# JavaScript

# Lisp

- <https://www.darkchestnut.com/>
- <https://tech.grammarly.com/blog/running-lisp-in-production>

# OCaml

- <https://engineering.issuu.com/2015/09/17/ocaml-production>

*A collection of links to notes, books, papers, articles and videos.*

### Paleontology & Evolutionary Biology

- <a href="url"><img src="cover_978-0-471-20507-4.jpg"  width="120" ></a>
  Christoph P. Zollikofer, Marcia Ponce de Leon. *Virtual Reconstruction: A Primer in Computer-Assisted Paleontology and Biomedicine*, 978-0-471-20507-4, 2005, 333 Pages;

- <a href="url"><img src="cover_978-1-118-59113-0.jpg"  width="120" ></a>
  Mark Sutton, Imran Rahman, Russell Garwood. *Techniques for Virtual Palaeontology*, 978-1-118-59113-0, 2014, Wiley-Blackwell, 208 Pages

- <a href="url"><img src="cover_ 978-3642162701.jpg"  width="120" ></a>
  Ashraf M.T. Elewa (Editor), *Computational Paleontology*, 2011, Springer-Verlag Berlin Heidelberg

### Computer Graphics & Visualization

- <a href="url"><img src="cover_ 978-0128006450.jpg"  width="120" ></a>
  Matt Pharr, Greg Humphreys, Pat Hanrahan. *Physically Based Rendering: From Theory to Implementation, Third Edition*, online: <https://www.pbrt.org/>

- <https://www.disneyresearch.com/>
- <https://www.ilm.com/rnd/>

- <https://github.com/THUNLP-MT/MT-Reading-List>

### Distributed systems

- [*Time, Clocks, and the Ordering of Events in a Distributed System.* Leslie Lamport (1978)](Time%2C%20Clocks%2C%20and%20the%20Ordering%20of%20Events%20in%20a%20Distributed%20System.Leslie%20Lamport%20(1978).pdf)

## Articles

- <https://www.theatlantic.com/science/archive/2018/04/the-scientific-paper-is-obsolete/556676/>

Writing user stories is not an easy task. Here are some articles and books which could help you to start.

- <https://medium.freecodecamp.org/how-and-why-to-write-great-user-stories-f5a110668246>
-  

<http://www.highfivehq.com>

<https://docs.google.com/presentation/d/1n2RlMdmv1p25Xy5thJUhkKGvjtV-dkAIsUXP-AL4ffI/edit#slide=id.g3fb17d6480_0_10>
<https://pbpython.com/notebook-process.html>
<https://github.com/abhat222/Data-Science--Cheat-Sheet/blob/master/Excel/Pivot%20Table.pdf>
<https://www.santafe.edu/news-center/news/can-physics-ideas-apply-paleontology>
<https://github.com/allenai/allennlp/blob/master/allennlp/state_machines/states/grammar_based_state.py>

<https://machine-learning-for-physicists.org/>

<https://github.com/geoalg/prog_ex_sols/tree/master/libgasandbox_no_opt>

## Software for geology

## Software for geophysiscs

<https://github.com/fatiando>
