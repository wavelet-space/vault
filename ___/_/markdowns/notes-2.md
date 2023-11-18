# Návod na život

# Geometrická algebra

## Implementace

| Jazyk       | Repozitář
|-------------|----------------------------------------
| C#          | <https://github.com/reloZid/algeosharp/>
| C++         | <https://github.com/wilderlopes/OpenGA>
| C++         | <https://enkimute.github.io/ganja.js/examples/coffeeshop.html#complex_least_squares>
| Haskell     | <https://github.com/ga/Haskell/blob/master/GABlade.hs>
| Haskell     | <https://github.com/IreneKnapp/geometric-algebra>
| Haskell     | <https://github.com/phischu/geometric-algebra>
| Haskell     | <https://github.com/pnutus/geometric-algebra>
| JS          | <https://github.com/enkimute/ganja.js/>
| JS          | <https://github.com/weshoke/versor.js/>
| Julia       | <https://github.com/andrioni/GeoAlg.jl>
| Mathematica | <https://github.com/jlaragonvera/Geometric-Algebra>
| Python      | <https://github.com/pygae/clifford>
| Python      | <https://github.com/tdvance/GeometricAlgebra/>
| Python      | <https://github.com/tingelst/pyversor>
| Python      | <https://github.com/ereide/pyga-camcal/>
| Rust        | <https://github.com/Limeth/hestenes>
| C++/Python  | <https://github.com/tingelst/game/>

## Knihy

New Foundations for Classical Mechanics. David Hestenes (1999, Springer)

## Odkazy

<http://www.openga.org/>

## Články

<https://slehar.wordpress.com/2014/03/18/clifford-algebra-a-visual-introduction/>
<https://slehar.wordpress.com/2014/06/26/geometric-algebra-projective-geometry/>
<https://slehar.wordpress.com/2014/07/24/geometric-algebra-conformal-geometry/>

Python: predicate methods as properties?

<https://stackoverflow.com/q/29568304>

## Google Colab

### Local Runtime

<https://research.google.com/colaboratory/local-runtimes.html>

    pip install jupyter_http_over_ws
    jupyter serverextension enable --py jupyter_http_over_ws


    jupyter notebook \
      --NotebookApp.allow_origin='https://colab.research.google.com' \
      --port=8888 \
      --NotebookApp.port_retries=0

    jupyter notebook --NotebookApp.allow_origin='https://colab.research.google.com' --port=8888 --NotebookApp.port_retries=0

For firefox please do this:
Type this to adress bar: `about:config` and find `network.websocket.allowInsecureFromHTTPS` and set to true.

Add reload to iapsg

import sys
sys.modules.clear(  )
<https://www.oreilly.com/library/view/python-cookbook/0596001673/ch14s02.html>

Technical Writing, Business Requirements
Message Integration Patterns, Service Oriented Architecture, Event Driven System
Model Driven Development

Pro oblast zájmu vytvoř slovník pojmů (glosář) tj. definuj termíny, pomocí termínů vyslov fakta a
pomocí faktů pravidla (terms -> facts -> rules)

## System modeling

- Simulation
  - Discrete Time Simulation + Discrete Event System Specification
  - Discrete Event Simulation
- Finite State Machine + Markov Chain

- Probabilistic models := outputs the distribution of possible outcomes
  - Graphical models‎

- Deterministic models

--

## Programming

# Předmet pro zápis 2019

Genetické metody v zoologii - MB170P59 zimní 6
Ekofyziologie živočichů a člověka - MB150P81 l 3
Zoologie obratlovců - MB170P13A 6 l
Moderní statistické metody I - MB170P108
Moderní statistické metody II - MB170P109 3
Ekologie a genetika chování - MB170P35 z 3
Evoluční genetika - MB170P102 z
Molekulární fylogenetika a taxonomie - MB160P21 z 3
Genetika - MB140P17 z 5
Vývoj člověka - MG422P56 3 z
Etologické metody I - MB170P60A 2 Z
Etologie a sociobiologie - MB170P107 5 Z
Sociobiologie primátů a člověka - MB170P93 3 l
Sociobiologie a behaviorální ekologie II
Molekulární ekologie - MB170P111 5 l

## Matematické modelování geodynamických procesů

### Modelování exogenních procesů

- <https://github.com/badlands-model/pyBadlands>
- <https://github.com/badlands-model/pyBadlands_serial>

### Modelování endogenních procesů

...

## Machine Learning

### Semantic Image Synthesis

- <https://github.com/NVlabs/SPADE>

## Animal behaviour

Děěp convolution network anad rats communications

- <https://www.youtube.com/watch?v=25LYVxTUZhM>

<https://www.youtube.com/watch?v=ADOjT_w0m2I>
<https://www.youtube.com/watch?v=xKjaWYAb1G0>

Vydejte se s námi na výlet do třetihor! Miocén byl klimaticky teplým obdobím s řadou výrazných paleogeografických a paleoenvironmentálních změn.

Před námi je poslední letošní seminář, tentokrát zaměřený na vývoj Centrální Paratethydy, tedy oceánské domény, která vznikla na konci jury a jejíž relikty dnes představuje třeba Kaspické moře nebo Aralské jezero.

Zánik dinosaurů a globální změny na konci křídy jsou jedním z velkých témat světové geologie: co bylo jejich příčinou?

Spread operator aka Python unpacking

<https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Operators/Spread_operator>

Unicredit Bank
<https://github.com/unicredit>

numpy is slower than standard library on small arrays!
<https://github.com/numpy/numpy/issues/8532>

Biodiversity
Conservation
Cladistics
Collection Management
Comparative Anatomy
Ecology
Evolution
Evolutionary Biology
Fauna
Fossils
Functional Morphology
Geology
Geometric Morphometrics
Invertebrate Paleontology
Jellyfish
Macroevolution
Micromammals
Morphological Analysis
Morphometric Analysis
Morphometrics
Neuroanatomy
Palaeoecology
Paleontology
Phylogenetic Analysis
Phylogenetics
Phylogeny
Planetary Science
Scientific Illustration
SEM/EDX
Systematics
Taphonomy
Taxonomy
Vertebrate Paleontology
Zoology

# My personal notes on everything

*Learn How Everything Works!*

Contributions welcome!

## Recipes in various programming languages for a quick reference

## Overview

**Neworking**
- Query the REST API
- Download a file to a specified directory
- Check if an REST resource exists
- Extract the URL origin (scheme/host/port)

## Networking

### Query the REST API

### Download a file to a specified directory

### Check if an REST resource exists

### Extract the URL origin (scheme/host/port)

# Glossary

- *recursion*

- *tail recursion*
  An optimization technique that allows recursive functions of arbitrary depth without consuming stack space).

- *stack*

- *heap*

# APSG

Add **hash** method to Tensor class.
Tensor class is immutable class with structural equality,-- this is a true value object,
so we should override **hash** method  so the hash is calculated from the tensor values.

Don't inherit from ndarray.

Use properties not private values.
e.g tensor...

## Programování

Před každým projektem si ujasni k čemu má sloužit

- Napiš krátký seznam jeho vlastností
- Založ soubor s požadavky a domenovými znalostmi
- Vztvoř slovník a kontextovou mapu.

Každý program rozděl na samotné jádro (knihovna) a rozhraní např. konzolové, grafické atd. a testy.
Program si tedy např. rozděl takto:

    core.cpp
    test.cpp
    main.cpp

<https://github.com/huxingyi/dust3d/tree/master/src>

Kdy použít anaonymní jmenný prostor (anonymous namespace)?

- <https://en.cppreference.com/w/cpp/language/namespace>

Game Engine/Design
---
<https://www.redblobgames.com/grids/hexagons/>
<http://www.gameprogrammingpatterns.com/>

# Aktivace C++ kompilátoru na Windows

<https://docs.microsoft.com/en-us/cpp/build/building-on-the-command-line?view=vs-2015#developer-command-files-and-locations>

2015

"C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\amd64\vcvars64.bat"

2017
"C:\Program Files (x86)\Microsoft Visual Studio\2015\Community\VC\Auxiliary\Build\vcvars64.bat"

Cmake, C++ Blogs
<http://www.brianlheim.com> | <https://github.com/brianlheim>
<http://klmr.me/about/>     | <https://github.com/klmr>
<https://preshing.com/>     | <https://github.com/preshing>
<https://preshing.com/20170511/how-to-build-a-cmake-based-project/>
<http://kaba.hilvi.org/pastel-1.3.0/techniques_specialization.htm>

<https://oopscenities.net/2011/04/30/c-inheritance-on-template-specialization/>

------------------------------------------------------------------------------------------

# CMake

------------------------------------------------------------------------------------------

Záznam přednášek o nástroji CMake

<https://www.youtube.com/watch?v=eC9-iRN2b04>
<https://www.youtube.com/watch?v=bsXLMQ6WgIk&feature=youtu.be&t=37m15s>

Knihy o CMake
<https://crascit.com/professional-cmake/>

Články o CMake
<https://crascit.com/2017/04/18/generated-sources-in-cmake-builds/>

file(
    WRITE main.cpp
        "#include <iostream>\n"
        "int main() { std::cout << \"Hello World!\" << std::endl; return 0; }"
)

---

CLAng
---
<https://marketplace.visualstudio.com/items?itemName=LLVMExtensions.llvm-toolchain>

------------------------------------------------------------------------------------------

# C++

------------------------------------------------------------------------------------------
<https://chromium.googlesource.com/chromium/src/+/HEAD/styleguide/c++/c++-dos-and-donts.md>
<https://cppdepend.com/>
Nástorj pro staticku analýzu kódu a občas dobré články a studie projektů.
<https://www.fluentcpp.com/>
Blog o C++ -- něco se dozvíš ale není to zaručený zdroj.

<https://vector-of-bool.github.io/2018/09/16/layout-survey.html>

Curiously recurring template pattern
PIMPL
Rule of 3/5

Why use struct with operator instead of function

Project Managment

Use clang-tidy
Use appveyor.yml, circle.ci, travis

Proč používat nullptr?

Jak použít delegating constructors?

Co je to enum class?

K čemu je *range based loop*?
<https://en.cppreference.com/w/cpp/language/range-for>

struct vs class

reference type &

const method

nothrow method

How to make your class non derivable = final
final class (C++11)

raw pointer

unique pounter, shared pointer

lvalue, rvalue, move semantics

rule of five

explicit constructor, virtual destructor

type traits + concepts (C++ 20)

async + threads

template function, template parameter

template class

const + constexpr

TBB (Threading Building Blocks)
Boost
Qt
GoogleTest, GoogleMock, Catch, Doctest

# Fortran

coarray

-------------------------------------------------------------------------------

# Python

-------------------------------------------------------------------------------

- Jak a proč požívat datové třídy
  <https://docs.python.org/3/library/dataclasses.html>

- Async/Await

Numba
Cython
C++/C/Fortran Extensions

How to install packages not on PyPi.

How to write `setup.py` to use a git repository as a dependency

    dependency_links=['http://github.com/<user>/<repository>/tarball/master#egg=<package_name>-<package_version>']
    dependency_links=['http://github.com/<uetoyo>/result/tarball/master#egg=result-1.3.1']

Nepoužívej v metodách privátní členy třídy, pokud existuje metoda nebo property, kterou můžeš získat požadovanou hodnotu atributu.

např.

    class Rectangle:

        def __init__(self, width, height):
            self._size = (width, height)

        @property
        def width(self):
            return self._size[0]

        @property
        def height(self):
            return self._size[1]

        @property
        def area(self):

            # ANO
            return self.width * height

            # NE
            return self.size[0] * size[1]

# Computer Graphics Notes

## Graphic Primitive Object

- What is mesh?
-

# Graphics file formats

## 3D Model File Formats

### OBJ + MTL

- extension .obj
- Wavefront Technologies
- <https://en.wikipedia.org/wiki/Wavefront_.obj_file>

MTL (Material template library)

### PLY

Polygon File Format

## Image Graphics File Formats

<https://en.wikipedia.org/wiki/Image_file_formats>

### Raster Graphics File Formats

- Exif

- JPEG (Joint Photographic Experts Group) <https://en.wikipedia.org/wiki/JPEG>

- TIFF (Tagged Image File Format) <https://en.wikipedia.org/wiki/TIFF>

- PNG

- GIF (Graphics Interchange Format)

- BMP (Windows Bitmap)

- PPM, PGM, PBM, and PNM

### Vector Graphics File Formats

### Container formats of raster graphics editors

- PSD
- PSP

# Země

In 1961, L. Slichter pointed out that some of the Earth's seismic modes might consist of translational oscillations of the solid inner core about its equilibrium position at the centre of the Earth. This motion, the "Slichter mode", is principally controlled by the density jump between the inner and outer core, and the Archimedean force of the fluid core. Its period is thought to lie within 4-8 hours and is split into 3 components by the Earth's rotation.

# GUI/UI

Imediate vs Retained Mode
<https://docs.microsoft.com/en-us/windows/desktop/learnwin32/retained-mode-versus-immediate-mode>

Témata k zamyšlení a práci?

Navigace zvířat pomocí magnetismu a echolokace

<https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3179100/>
17. Holland RA, Thorup K, Vonhof MJ, Cochran WW, Wikelski M. Navigation: Bat orientation using Earth's magnetic field. Nature. 2006;444:702

## Evoluce Nervového Systému

Mgr. Pavel Němec, Ph.D.

## Morfologie živočichů - MB170P4

Mgr. Pavel Němec, Ph.D.

<https://is.cuni.cz/studium/predmety/index.php?do=predmet&kod=MB170P46>

řehled základních orgánových soustav mnohobuněčných živočichů z hlediska jejich vzniku, ontogenetického vývoje a evolučních souvislostí. Důraz je kladen především na obratlovce v kontextu strunatců a na klíčové momenty morfogeneze a evoluce Animalia.
Výklad se omezuje na základní obecná schémata; popis konkrétních variant přenechává navazujícím přednáškám fylogeneze a systému.

Sylabus

1: Úvod, historie, význam a rozčlenění oboru. Orientace na těle živočicha, připomínky kontextu systému, fylogeneze, evoluce, forma & funkce. Živočichové (Animalia).
2: Vývojová morfologie: důležitost ontogenetických znaků pro pochopení morfologie; embryonální původ orgánových soustav, morfologie larev. Evoluční morfologie: tělní plány, Hox geny, kambrická exploze.
3: Pokryv těla, integument, povrchy.
4: Mechanizmy pohybu I: Měňavkovitý pohyb, brvy, bičíky, kost, sval.
5: Mechanizmy pohybu II: Kostra a svaly hlavy.
6: Mechanizmy pohybu III: Axiální skelet a svalstvo, kostra a svaly končetin.
7: Integrace I.: Smyslové orgány.
8: Integrace II: Nervová soustava.
9: Integrace III: Humorální regulace, žlázy s vnitřní sekrecí.
10: Metabolismus I: Příjem potravy, trávící soustava.
11: Metabolismus II: Dýchání, dýchací orgány, oběhová soustava.
12: Osmoregulace, vylučování & reprodukce.

Zdroje

Vynikající česká klasika, žel jen na obratlovce:
Gaisler, Zima: Zoologie obratlovců. Academia, 2007.
Asi nejlepší "vertebratologie":
Liem, Bemis, Walker, Grande: Functional Anatomy of the Vertebrates, an evolutionary perspective. Kterékoliv vydání.
Také pěkná a prudce doporučitelná:
Kardong: Vertebrates. Comparative anatomy, function, evolution. Kterékoliv vydání.
Nejlepší "invertebratologie":
Ruppert, Fox, Barnes: Invertebrate zoology. Kterékoliv vydání.
Také pěkná a prudce doporučitelná:
Brusca a Brusca: Invertebrates. Kterékoliv vydání.
Obecně zajímavé a prudce doporučitelné:
Zrzavý J.: Fylogeneze živočišné říše.

Chemie

## Síran (Sulfate) SO_4^2-

Soli odvozené od H_2SO_4
Anhydrit, Sádrovec, Baryt, Kamenec

K_2SO_4; Síran draselný, Potassium sulfate; Draselná sůl H_2SO_4

## Siřičitan (Sulfite) SO_3^2-

## How to write recipes

You can write everything in the form of requirements e.g

    "As u user I want to be able to export Python notebook to PDF",

This can be easily translated to the form of recipe e.g

    "How to export Python notebook to PDF".

or to to the form of command (imperative)

    "Export Python notebook to PDF"

- Find broken links in text.

- Find grammar mistakes in text.
  - misspelled words
  - missing punctuation
  - missing a/an/the
  ...

User Story se orientuje na výsledek a důvody.
Use Case přesně popisuje kroky, jak výsledku dosáhnout.
User Story tedy může vést na různé Use Cases.

For clients (users of the product) it

Scenario: Person registration.

As the [user] on the [page]
When the the [add-new-button]
Then [person_form] is visible.

Formáty:

"As a <persona>, I want <what?>"
"As a <persona>, I want <what?> so that <why?>"
"As a <persona>, I can <action with system> so that <external benefit>"

Project:
    Data Analyzer

Personas:
    Analyst

User Stories:

As a <analyst> I want to see all existing analyses.
As a <analyst> I want to see existing

As <anonymous_user> when I visit <index_page> then <loggin_form> is visible.

Non-Functional User Stories
Ty které přímo nesouvisí s konkrétní funkcí systému, ale s nějakou jeho obecnou vlastností např.
As a user, I want to be able to run application in all mahor web browsers.

COMPANY
SERVICE/EXPLORE
CONTACT

UI/UX
QA/CD

MS710P05    Matematická statistika
Fyziologie

Morfometrie
<http://www.indiana.edu/~g562/>
<https://link.springer.com/article/10.1007/s11692-009-9055-x>

Začni tvorbou doménového modelu.

Nejdříve identifikuj tzv. bounded-context, v našem případě. registrování osob, tj. Máme

BOUNDED-CONTEXT musí obsahovat alespoň 1 AGRREGATE.
AGGREGATE musí obsahovat právě jeden AGGREGATE-ROOT.
AGGREGATE_ROOT musí být typu ENTITY.

Algoritmy

Bresenhams Line Algorithm

INSPIRACE

<https://github.com/glampert/vectormath/>
DATA ORIENTED DESIGN

<https://www.fluentcpp.com/2018/12/21/an-soa-vector-with-an-stl-container-interface-in-cpp/>
<https://shot511.github.io/>
<https://github.com/uetoyo/pulse/blob/master/cplus_prototype/old/vector.hpp>
<https://github.com/root-project/root/tree/master/math>

Tests
----
<https://github.com/mattkretz/virtest>
<https://github.com/pfultz2/Prove/blob/master/include/prove.hpp>
<https://github.com/whunmr/msgtest/blob/master/samples/sample_tests.cpp>
<https://github.com/misoboute/ProTest/blob/master/Sample.cpp>

<https://github.com/plotfx>

<https://github.com/borasoftware/balau/blob/master/src/main/cpp/Balau/Serialization/SerializationMacros.hpp>

TODO

Zlepšit wokflow pro psaní dokumentů.
Jak aplikovat kontrolu pravopisu na textové dokumenty?
Jak zobrazit nějakou lingvistickou analýzu, např. frekvence slov atd.

Jak spravovat proposal?
Dej jim stav:

- proposed
- accepted
- rejected
- finished

Algoritmy:
Pixel Perfect

<https://medium.com/@plotnick/beyond-the-hammer-and-whisk-broom-the-technology-of-paleontology-c81088e2164d>

Jak správně navrhnout a dokumentovat REST API?

<https://github.com/Microsoft/api-guidelines/blob/vNext/Guidelines.md#51-errors>

Co je to REST bez PUT? <https://www.thoughtworks.com/insights/blog/rest-api-design-resource-modeling>

<http://michal.karzynski.pl/>

Jak vytvářet task y na pozadí?
Lze použít

Jara podobná meagic carpet, kde si tkáš valstní koberec s geometrickým vzorem.

Alexander_Grothendieck

Součástí zápočtu bude práce o maximálním počtu 12000 znaků, což bz mělo studenta vést k tomu aby se vzjádřil na
tomto prostoru, naroydíl od jiných tzpl prací, ketré podporují a vznucují natahování prce na minimální počet znaků.

Hodnocení a zkouška jako taková  bude v rámci možnosttí individuální.
Každému vyhovuje jiná forma royhovoru, někomu písemná forma někomu śtní a někomu kombinovaná.

Součástí metodiky hodnocení je předevší objevit studentovi silné stránky nikoliv najít jen jeho slabiny.
Pokud ale student salbinz má, má právo  o nich vědět abz na nich mohl pracovat, bez negatovního dopadu na jeho hodnocení.

Dnes jednoduchá věc -- binární klasifikátor v Pythonu

[] Protokoly Hydrogeologie
[] Protokoly Geofyzika
[] Protokoly Mineralogie
[] Protokoly Geochemie

Jak ignorovat nějaký soubor nebo adresář jen v mém projektu?
Např. chsi sám používat pyproject.toml, ale nechci ho přidávat do vzdáleného repozitáře.

PŘEHLED

4-11-2018
---

Započatá práce na tinyrenderer
Implementován Vektor a částečně Matrix, funkce draw_line a draw_triangle.
Program již umí vykreslovat do TGA.

5-11-2018
---

Práce na tinyrenderer.

6-11-2018
---

Implementace jedoduchéheo frame buferru.

29-11-2018
---

Práce na aplikaci Cro-DataAnalyzer s Adamem Mertelem, úprava REST API serveru (zjednodušení).

30-11-2018
---

Migrace z Pythonu do C#/F#?

Jak vést projekt?
Jak psát čistě tak, abychom se nebáli program rozšiřovat?

Simple compile time tests in C++

---
Popsat chování frontendu jako stavový automat.

Vytvoř novou analýzu
Vutvoř nový filtr

Motivace pro projekty
---------------------

DataSpect

WorkFlows

3D Modelování vyhynulých druhů.
Jak z kostry rekonstruovat měkké tkáně jako svaly a kůži?

Publikovat krátké animace a naučná videa na internetu -- musíme mít ale možnost oprav neboť věda reviduje poznatky.
Srovněj s malbami Zdeňka Buriana, které nejsou již aktuální z vědeckého hůediska, přestpže zůstavají výbornými obrazy.

V C++ můžeme buď použít dědičnost nebo specializaci.
Jaký je v tom rozdíl?

Python/Numpy Scipy

Násobení matic
Sčítání matic
Násobení matice skalárem

Problémy fosilního záznamu.
nekompletní nález
nálezy přísluší různým fázím vývoje -- mladý vs starý jedinec.
deformace/distorze nálezu -- např. deformace lebky vedla k přiřazení stejného druhy dvoum taxonům Schultz
and Falkenbach (1956, 1968) Eocene-Oligocene oreodont Miniochoerus

c++ blogy
<https://www.fluentcpp.com>

Python blogy

Math blogy

<http://www.euclideanspace.com/maths/algebra/realNormedAlgebra/quaternions/transforms/derivations/vectors/index.htm>

Zajímavé Python moduly.

<https://github.com/Delgan/loguru>

<https://github.com/alicevision/meshroom>

Biologie

Parafyletický
Monofyletický

Taxon

Kladistika

Počítačová Tomografie CT Scan

Evoluční biologie
Teorie přerušovaných rovnováh

Fitness Landscape

Paleobilogické databáze
<http://fossilworks.org>

-- | Vrací barvu s normalizovanými složkami, tz,. že pokud složka barvy přesahuje
-- | rozsah 0 až 1.0, je automaticky převedena na maximální hodnotu 1.0.
Should we use inheritance or specialization for our vector class?

```c++
template <size_t N, typename T>
struct vector
{
    /* some code */
};
```

## 1. Inheritance

```c++
template <typename T>
struct vector_2 : vector<2, T>
{
    /* derive the code */
}
```

## 2. Specialization

``` c++
template <typename T>
struct vector_2 : vector<2, T>
{
     /* repeat the code */
}
```

## enable_if

template <size_t N, typename T>
struct vector {

    // enable_if N == 2
    ...

    // enable_if N == 3
    ...
};

<https://stackoverflow.com/questions/723702/inheritance-vs-specialization>
Instalace balíku pro vývoj.

Použití modulu venv
soubor setup.py
 -

setup(
    # ...
    install_requires=[
        # ... (your usual install requirements)
    ],
    extras_require={
        'testing': [
            # ... (your test requirements)
        ]
    },
)

Then install your package with test requirements like this:

instalace balíku do virtuálního prostředí s přepínačem -e (editable mode)
pip install -e ".[testing]"

sum :=
    x: float
    y: float,
    z: float -> float
{
    x + y + z;
}

vec := {x: float, y: float, z: float }

Příběh o evoluci v biotické rezervaci -- viz projekt Biota, který přetrval zkázu světa.

Algebra -- příprava ke zkoušce

## 2 Řešení soustavy lineárních rovnic (Gaussova eliminace)

Definice (2.7) Ekvivalentní úprava soustavy lineárních rovnic je taková, která nemění množinu všech řešení.

Definice (2.6) Elemantární úprava jsou

  1) prohození dvou rovnic
  2) vynásobění rovnice nenulovým t
  3) přičtení t-násobku jedné rovnice k druhé

Tvrzení (2.10) Každá elemntární úprava je ekvivalentní úpravou.

- Soustava s právě jedním řešením
- Soustava s nekonečně mnoha řešeními
- Soustava bez řešení

## 3 Těleso

Definice (3.1) Binární zobrazení

Definice (3.2)  Těleso **T** je množina prvků T spolu se dvěma binárními operacemi + a * na T, tj. **T** = (T, +, *), splňující podmínky (axiomy tělesa):

    - asociativita +
    - existuje nulový prvek
    - existuje opačný prvek
    - komutativita +

    - asociativita *
    - existence jednotkového prvku
    - existence inverzního prvku
    - komutativita *

    - distributivita a * (b + c) = ab + ac

    - T má alespoň dva prvky

Definice (3.15) *Charakteristika tělesa*

Věta (3.16) Charakteristika každého tělesa je buď 0 nebo prvočíslo.

Konečná tělesa

Charakteristika a konečnost

Modulární počítání (modulo n)

Součin modulo n je zbytek při dělení součinu a * b číslem n.

Kvaterniony jako nekomutativní těleso

Znalosti

- Počítání v tělesech Z_p a řešení lineárních rovnic nad tělesy Z_p.

## Matice

Definice (4.7)
Maticí typu m * n na tělesem **T** rozumíme obdélníkové schema prvků tělesa T s m řádky a n sloupci.
Matice typu m* m se nazývá čtvercová typu m (nad tělesem T).
Matice typu m *1 se nazývá sloupcový aritmetický vektor (nad tělesem T).
Matice typu 1* m se nazývá řádkový aritmetický vektor (nad tělesem T),

Definice (4.8)
Čtvercová matice A = (a_{ij}) je

- horní trojúhelníkova
- dolní trojúhelníková
- diagonální
- jednotková
- permutační
- symetrická
- antisymetrická
- nulová
- stochastická

## Lineární Zobrazení

## Lineární Prostor

Matice Linárního zobrazení

## Lineární prostor konečné dimenze

# Mineralogie

## 1

## 2

## 3

## 4

## 5

## 6 Optika (10b)

## 7 Empirický vzorec APFU -> HM (12b)

## 8 Empirický vzorec HM -> APFU (8b)

## 9 Minerál vzorec/symterie (10b)

## 10 Fázový diagram Kyanit-Andalusit-Sillimanit (6b)

## 11 Sekundární Zonálnost Hydrotermální žíly (7b)

## 12 Vysvětlete termíny (5b)

Hyacint = odrůda Zirkonu
Melatopa = optika?
Pleochroismus = změna barvy nebo jejího jasu či saturace  při natáčení minerálu, tj jde o optickou vlastnost.
Svatoondřejkský Kříž =  typ dvojčatění?

Vzájemné míení granátů
Ugrandit = vápenatý granát
Pyraslpit = hlinitý granát

15 druhů granátů:

- pyrop
- almandin
- spessartin
- grosular
- andradit
- uvarovit

# Modely fázových přechodů

== Teoretická část

## Fázový diagram

Fázový diagram či je obecně graf ze kterého lze vyčíst fázový stav systému za daných termodynamických podmínek, obvzkle teplota a tlak.
Rozhraí mezi fázemi je reprezentované liniemi, které se mohou různě protínat. V těchto průsečných bodech mohou současně existovat různé fáze, např v případě Ky/Si/And

Modely fázových přechodů
Models of Phase Transtions

Pevná fáze
Disipativní fázové přechody

## Krystalová soustava

== Praktická část

## Kyanite-Sillimanite-Andalusite

Celý systém je definovaný jedinou složkou (komponentou) Al2SiO5 tj. všechny fáze mohou vzniknou z této jedinné složky.
Ky/And/Sil tvoří tzv polymorfní fáze, tj. chemicky shodně avšak strukturně rozdílné látky. Kyanit krystalizuje v triklinické soustavě,

### Binární fázový diagram

### Ternární fázový diagram

## Molekulární dynamika

# Návrh typu `Vector<N, T>` v C++ pro potřeby počítačové grafiky

## Úvod

V počítačové grafice často potřebujeme pracovat s aritemitckým (algebraickými) vektory ve 2 až 4 dimenzích. Typu které tyto vektory představují bychom tedy naivně mohli navrhnout as

```c++
struct Vector2 { /**/ }


struct Vector3 { /* code */ };






Fyzika Materiálů

Point Defects
---

Compositions
---



-------------------------------------------------------------------------------
# Termodynamika
-------------------------------------------------------------------------------

Definice: Látka je chemická entita (prvek, sloučenina)

Definice: Forma, polymorfní forma

Složka

Směs, Homogenní Směs, heterogenní směs.

Fáze, jednosložková fáze, vícesložková fáze,

Skupenství

Fázová změna (*phase transition*) je děj,

Reakce

Polymorfie

Systém

uzavřený systém

dU = δQ + δW

-------------------------------------------------------------------------------
# Antropologie
-------------------------------------------------------------------------------

Raymond Dart
objevitel Taugského dítěte -- Australopithecus

# Geometrická morfometrie
# Evropští primáti order Plesiadapis

Aye Aye; Madagaskar

-------------------------------------------------------------------------------
# C++
-------------------------------------------------------------------------------

## Idiomy

### Non-copyable Mixin
Zabraňuje aby třída byla copy-constructible nebo assinable do jiné instance.
dále *Return Value Optimization*






Event Sourcing Projects

OOP PHP

https://github.com/neos/Neos.EventSourcing



/*

## Úvod

Naším úkolem bude vytvořit jednoduchý softwarový renderer, tedy jen za využití CPU, naprogramovaný v C++.

Využijeme generického programování, které C++ umožňuje pomocí tzv. šablon tříd a funkcí.

```c++
template <typename Dimension, Scalar> Vector {
    ...
}
```

Později zkusíme tuto implelemtaci rozšířit o GPU (OpenGL) renderování a dále porovnat lineární algebru s geometrickou algebrou.

## Lekce 00

Sezámení se s C++, nastavení editoru, kompilátoru a strucktura projektu.

## Lekce 01

První úkolem bude napsát minimální kód pro definici geometrických objektů jako je `Vector` a `Matrix`.

Pro uložení hodnot používáme pole, jehož velikost je známa v době kompilace.
To nám pomůže procházet hodnoty v operátorech pomocí cyklu, kdy známe délku tohoto pole.

### Bresenhamův algoritmus pro kreslené čáry

## Lekce 02

Naším úkolem je vyktreslit trojúhelník. Jak na to půjdeme? Co by měla splnévat procedura, která vyjkresluje trojúhleník?
Budem vykreslovat do obrázku tedy ve dvou dimenzích. Chceme nakreslit vyplnění trojúhelník stejně jako pouhý obrys.

Barycentrické souřadnice

Mějme 2D trojúhelník `T = (A,B,C)` a bod `P` zadaný pomocí kartézských souřadnic `(x, y)`.
Naším úkolem je nalézt barycentrické souřadnice bodu `P` vzhledem k  trojúhelníku `T`.

Hledáme tedy tři čísla (1 - u -v , u, v) taková, že můžeme nalézt bod P jako:

P = (1 - u -v , u, v)A + uB +  vC

Jak na to? Pro body A, B, C nalezneme čísla tzv. váhy, kterým násobíme souřadnice bodů A, B, C.
Jejich sečtením poté dostaname bod P nazýnaý barycentrum.
Bod P má koordináty (u, v) v ()

*/

How many times smaller would a carbon atom need to be to fit into an interstitial position in bcc Fe (α-Fe, ferrite) without introducing elastic deformation to the surrounding lattice? The radius of Fe atom is 0.124 nm, the radius of C atom is 0.077 nm.

Proof that a crystal lattice with a five-fold symmetry does not exist.

Determine Miller indices of the line of intercept of planes (320) and (110).

Determine Miller indices of the plane which contains directions [-130] and [201].

Calculate the angle between directions [110] and [111] in a cubic system?

Calculate the angle between planes (111) and (110) in a cubic crystal.

The rate at which a metal oxidizes is a typical example of a practical use of Arrhenius equation. The oxidation rate of magnesium is represented by a rate constant k. The value of k at 300 °C is 1.05·10-8 kg/(m4·s). At 400 °C, the value of k increases to 2.95·10-4 kg/(m4·s). Calculate the activation energy for this oxidation process.
The fraction of vacant lattice sites in aluminium at 660 °C (just below the melting point) is 8.82·10-4. Calculate the vacancy concentration at 400 °C. Energy required to create one vacancy is 0.75 eV.

Determine the equilibrium number of vacancies in 1 cm3 of copper at 1000 °C. Energy of vacancy formation is 0.9 eV. The molar mass of copper is 63.5 g/mol and the density (at 1000 °C) is 8.4 g/cm3.

Calculate the ratio of Schottky and Frenkel defects at room temperature. The energy required to form a vacancy is 0.75 eV and the energy to form an interstitial is 3 eV.
Energy needed to transfer a sodium atom from inside the crystal to the surface is 1 eV. Calculate the molar heat capacity of sodium at room temperature. Assume that the heat capacity arises purely from vacancies.

The diffusion constants of lithium in silicon are D0 = 2,3·10-7 m2/s and Q = 0,65 eV. Determine the temperature at which a lithium atom makes one jump per second.

Tvrzení: V kubickém systému jsou plochy a směry zadané stejnými směrovými indexy ortogonální.

# Studium

## Paleo

Paleozoikum
*Tullimonstrum gregarium*

## Computer Graphics & Games

<https://cglearn.codelight.eu/pub/computer-graphics>
<https://cglearn.codelight.eu/pub/programming-patterns-in-computer-games>

## Apache RcoketMQ

Co to je? <https://rocketmq.apache.org/docs/motivation/>
<https://rocketmq.apache.org/rocketmq/how-to-support-more-queues-in-rocketmq/>
Klíčové koncepty

## Pixel Voxel method
<http://www.like100bears.com/writing/>
<https://tak.itch.io/league>

- Nifi
- Camel
- Kafka
- Storm
- RocketMQ

Jak si organizovat den.

Ráno vstanu v 7:00, jdu do koupelny
V 8:00 vycházím z domu.
V 9:00 Dojdu na kávu nebo do práce a projdu emaily.
v 9:30 jsem  emaily hotov a začnu si plánovat den --respektive kontrolovat, co jsem si naplánoval večer.
10:00 začínám pracovat
12:00 jdu na oběd
13:30 pokračuji v práci
16:30 končím s programováním

## Python in Enterprise

- <https://julien.danjou.info/is-python-a-good-choice-for-entreprise-projects/>
- <https://www.paypal-engineering.com/2014/12/10/10-myths-of-enterprise-python/>

<https://www.quantstart.com/articles/Best-Programming-Language-for-Algorithmic-Trading-Systems>

<https://www.enthought.com/product/canopy-geoscience/a>

- [-] Definovat bezpečnostní politiku, jak a kde ukládata hesla aplikací.
- [-] Nasazovaní a synchronizace kontainerů a databáze. Použít Kubernetes, Swarm?

Pro vykreslení strucktury projektu do README můžeme použít `tree` jakn na Unixu tak na WIndows.

SSH Se na Windows nachází v `C:\Program Files\Git\usr\bin`

## Správa repozitářů

Jaké větve jsou v projektu aktivní?
Jak aktuální jsou větve v projektu?
Jak dlouho jsou větve otevřené?

## Založit si konfigy

<https://github.com/datachomp/dotfiles/blob/master/.gitconfig>
<https://github.com/datachomp/dotfiles/blob/master/.psqlrc>

Python SemVer <https://github.com/k-bx?utf8=%E2%9C%93&tab=repositories&q=&type=source&language=>

Používat 12factor

Konzolová aplikace pro ukládání a předzpracování zdrojových dat analýz.

Jak sledovat výkon python web aplikace?
Jak logovat requesty python web aplikace?
Jak zjištovat health python web aplikace?

Jak přejmenovávta hromadně soubory a složky.

project ENSURE!

## Contributing to Code

## Contributing to Documenation

### Spellchecking

---

## Jak na konzolovou aplikace

Každý program obsahuje:

- přepínač `-a | --about` -- description, authors, maintainers, license
- přepínač `-h | --help`
- přepínač `-v | --version`

# SOME USEFUL KEY SHORTCUTS

F2      Rename Folder/File
DELETE  Delete Folder/File
CTRL+X
CTRL+C
CTRL+V

# Questions

- Jak vytvořit statickou knihovnu pomocí gcc?

- Co to je kontingenční tabulka?

- Co to je SIMD instrukce?

- Jaký je rozdíl mezi debug a relaese módem na Windows?

- Jak vyprodukovat debug mód na Linuxu?
  GCC může produkovat objektové soubory s nebo bez debug symbolů pomocí pžepínače `-g`
 Stejně tak můžeme kontrolovat míru optimalizací pomocí přepinačů `-O1`, `-O2` a `O3`.

== Aplikace Event Sourcing na GUI

Pokud by všechny akce aplikace byly reprezentovány jako Command, pak by posíláním
zpráv do aplikace znamenalo, že můžeme reprodukovat chování uživatele. Představme si situaci, kdy naklikání nějakého postupu v aplikaci
by šlo simulovat, přehrát -- dokonce od uživatele získat celý log aplikace a jen se u sebe podívat co dělal špatně.

---

Pokud máme problém
No compiler is provided in this environment.
Pak ověříme, že proměnná prostředí JAVA_HOME je nastavena správně.

Nejdříve ověříme, kam maven  kouká pro:

    $ mvn --version
    Apache Maven 3.5.3 (3383c37e1f9e9b3bc3df5050c29c8aff9f295297; 2018-02-24T20:49:05+01:00)
    Maven home: C:\Program Files\apache-maven-3.5.3\bin\..
    Java version: 10.0.1, vendor: Oracle Corporation
    Java home: C:\Program Files\Java\jre-10.0.1
    Default locale: cs_CZ, platform encoding: Cp1250
    OS name: "windows 7", version: "6.1", arch: "amd64", family: "windows"

---

Vorticity, Vortex Dynamics

One of the most powerful applications of geometric algebra is to rotations (...)
p20

Spravovat knihovnu i tu sebemenší není lehké. Musíte se starat případnou opravu chyb,
dokumentaci a příklady, verzování. Musíte pro ni mít samostatný repozitář. Všechno toto vytváří tzv cognitive overhead.
Kdy tedy oddělit nějakou část kódu do samaostatné knihovny? Vždy když začíná být jasné, že ji využijete v jednom projektu.

Jak spravovat své projekty na Githubu a nezbláznit se z toho.
Musíte mít systém a každý projekt musíte umět popsat. Pokud neumíte popsat projekt, ani nevytvářejte nový repozitář.

Mějte sjednocená styl jak píšete README.
Ideálně mějte šablonu a skript, který README sestaví!
Spravujete automaticky labels pomocí github API.
Vytvořte si vlastní OVERVIEW přes Github api, kterí shrne vaše projekty.

Zajímavé Python knihovny pro numerickou analýzu a zpracování dat.

<https://dask.pydata.org/en/latest/>

C++
OpenFOAM

<https://cdn.rawgit.com/kostyfisik/FEA-compare/415666cafa5092ba1df09f148d668b135c224995/table.html>

media.io

    Stream | Image | Audio | Video

# Co musí být automatizováno

## Generování LICENSE

- rok(y)
- vlastník
- název
- obsah

## Generování README

- název projektu
- verze projektu
- autor projektu
- licence projektu

## Generování CI/CD konfigurace (CircleCI)

...<https://circleci.com/blog/continuously-deploying-python-packages-to-pypi-with-circleci/>

## Sémantické verzování

- povýšení verze v *init*.py
- povýšení verze v setup.py
- povýšení verze v README
- vytoření `git tag v{current_version}`

Na čem chci pracovat

Simulátor
Render 2D a 3D
WEB Framework CQRSv Pythonu

Rozumy

# PostgreSQL

databáze se musí zálohovat ideálně pravidelně a pod jasně zvoleným názvem.
dobře zvolený název obsahuje jméno a verzi a datum a čas zálohy.

databáze se musí zálohovat před změnou schématu nebo hromadnou úpravou dat.

databázi musíme verzovat a to tak, že mám sama tabulku, kde se uchovává verze.

databáze se musí replikovat, pokud selže jedna instance, je systém okamžitě přesměrován na jinou.

# SQLIte

SQLite používáme pro data aplikace.

SQLite je lepší než logování do souborů.

SQLite lze otevřít in-memory.

SQLite lze použít při výpdaku nebo offline práci a později synchronizovat se serverovou DB.

# Python

<https://mybinder.org/>
<https://blog.jupyter.org/jupyterlab-is-ready-for-users-5a6f039b8906>
<http://jupyterlab.readthedocs.io/en/stable/>
<https://github.com/Runscope/healthcheck>

Nové rozhraní pro Jupyter
<http://jupyterlab.readthedocs.io/en/stable/>

Generovat `not` metody automaticky:

Pokud dodržujeme konvenci `is_`, `can_`, `are_`, `has_` vracející `bool`, pak můžeme
`is_not_`, `can_not_`, `are_not_` `has_not_` generovat automaticky.

HTTP/REST knihovna navržená pomocí Domain Driven Design.

"""
Poznnámky:

Je třeba se rozhodnout kdy a kde používat absolutní vs relativní import.

Pokud jsem ve stejném modulu pak `from .submodule import T` není špatné, ale pokud jsem už v sub-submodulech provádím import ob úroveň, pak už je snad lepší dělat absolutní import.

    package/
        __init__.py
        namespace/
            module1/
                module1_core.py
                module1a/
                    module1a_core.py
            module2/
                module2_core.py


    from ..module1. import T

    from

Pokud jsem např v modulu app, pak bych asi taky už dělal absolutní import -- výhoda je, že když se pak app oddělí a ostatní knihovny se instalují jako závistolist z pypi/git pak nemusím importy nijak upravovat.

Standardní je že domain module je samostatný, infrastucture (persistence) závisí na domain, a app závisí na obouch

## Publish and Subscribe

Pro posílání zpráv není nutné ynát příjemce ani doručovatele.
Zpráva je poslána na EVENT_BUS, která se informuje všechny odběratele.

    EVENT_BUS
        register_handler
        unregister_handler

        register_subscriber
        unregister_subscriber

        publish(event)
        subscribe(event_topic)

    SENDER

    RECEIVER

## Point-to-Point

např aktor zasílá zprávu jinému aktoru.

What is an difference between event bus and event store

<https://groups.google.com/forum/#>!topic/axonframework/gn1OUj4NrME

SEVENT SOURCING NOTES

Všechny  příkazy, které aplikace má vykonat, jsou směrovány na centrální *command  bus* a ten podle kontextu rozhodne, jestli může být příkaz vykonán. Ve vykonání příkazu může zamezi nepovolená hodnota nebo nedostatěčné oprávnění uživatele (samotná implementace *command bus* viz dále). Samotná *command bus* tedy zaznamená každý příchozí příkaz a v případě, že byl schválen, je zpracován a přesměřován na *event bus* nebo zalogován s důvodem, proč se nemohl být příkaz vykonán.

Každá aplikace má také centrální *event bus*. Ta přijímá proud *event* objektů, které nesou potřebné informace, co a jak se má v doméně udát.

command(s) -> accepted -> produce event(s)

Příkazy také= mohou přijít v dávce, kdy očekáváme, že se provedou v zadaném pořadí a všechny, jinak celou dávku stornujeme.

Událost může vyprodukovat další události? a příkazy.

## Python

- <https://breadcrumbscollector.tech/implementing-event-sourcing-in-python-part-1-aggregates/>
- <https://breadcrumbscollector.tech/implementing-event-sourcing-in-python-part-2-robust-event-store-atop-postgresql/>
- <https://breadcrumbscollector.tech/implementing-event-sourcing-in-python-part-3-robust-event-store-atop-rethinkdb/>
- <https://breadcrumbscollector.tech/implementing-event-sourcing-in-python-part-4-efficient-read-model-with-projections/>

## General

<https://medium.com/@yauritux/ddd-part-ii-b0735ba584ca>
<https://dev.to/barryosull/event-sourcing-what-it-is-and-why-its-awesome>

<https://blog.novatec-gmbh.de/the-problems-with-swagger/>
> This is known as the Tolerant Reader Pattern . If you implement the tolerant reader pattern correctly, modifying the payload – i.e adding a new element – should not break the client code.
ADDING A NEW ELEMENT TO THE STRUCTURE OF THE PAYLOAD SHOULD NEVER BREAK YOUR CODE.

<<<<<<<

Monitorovací agenty ... zápis do DB + Slack.

ROLAP
<https://en.wikipedia.org/wiki/Online_analytical_processing#Relational_OLAP_(ROLAP)>

CURCUIT_BRAKER
<https://martinfowler.com/bliki/CircuitBreaker.html>

Automatická tvorba README v projektu.

<https://github.com/spotify/luigi/blob/master/luigi/task.py>
<https://github.com/audreyr/cookiecutter/blob/master/cookiecutter/cli.py>
<https://github.com/dbrgn/result/>

<https://stackoverflow.com/questions/33533148/how-do-i-specify-that-the-return-type-of-a-method-is-the-same-as-the-class-itsel>

Generický messager
    Posílat zprávy přes email, gitter, slack...

Aplikační statistiky pomocí SQL

např.

    select class from module where class.parent = 'SomeParentClass'.

Generátor setup.py souboru...

---

Přístup do databáze omezit na zlužbu, která ji poskutuje přes REST?
Výhodou je, že každý přístup do dataábze je nějak zaznamenáván a ošetřován na úrovni aplikace.
Stejně tak logging a přístupová práva -- odstínění od DB administrace + mockování služby namísto SQL a DB serveru.
- Asynchroní zpracování.

# SPRÁVA PROJEKTŮ

Projekty mám rozdělené na pracovní, soukromé a externí.
Pracovní projekty jsou ty, za které jsem placený a se kterými se více měně nehodlám
zabývat ve svém volném čase. Soukromé jsou naopak ty, které jsem vytvořil z valstní iniciativy,
spravuji je na svém Github/Bitbucket profilu a ve volném čase s nim trávím čas.
Podobně s externími  projekty často trávím svůj osobní čas, ale jde o projekty, které
založil a spravuje někdo jiný -- jde o osobní projekty někoho jiného :)

Takové striktní rozdělení není úplně možné, protože své osobní projekty někdy začnu používat v práci.
Také některé pracovní projekty jsou zajímavé a prostě i po práci s nimi strávím nějaký čas. Pro hrumé dělení
to ale stačí. Můj adresář tedy vypadá nějak takto:

    employ\
    external\
    personal\

Projekty pro Sublime Text 3 udržuji v jednom adresáři.

    _proj.sublime/
        rozhlas-aura-cpp.sublime-project

Projekty (workspace) pro Eclipse udržuji v jednom adresáři, avšk pro každou verzi
Eclipse zvláště. např.

        _proj.eclipse/
            4.5.mars_workspace/
            4.6.neon_workspace/

# DEVELOPMENT NOTES

Co potřebujeme

# (Specification) Predicate

# Filter

Filter je funkce (třída), která z kolekce vrací ty prvky, které odpovídají zadanému kritériu.
Filtry tedy použivájí interně predikát, který rozhoduje, jestli daný objekt vyhovuje-
Interně to může být např. jen lambda funkce nebo např. specifikace (viz Specification pattern)
Důležité je, že filtr je dobře pojmenován a je dobře testovatelný. Jako omplementci můžeme samozřejmě použít
funkci `filter`- Filtr vždy vrací kopii původní kolekce! a počet prvků může být nemůže být samozřejmě větší než déla vztupní kolekce -- může být však i 0.

Jak praví [Wikipedia](https://en.wikipedia.org/wiki/Filter_(higher-order_function))

> In functional programming, filter is a higher-order function that processes a data structure (usually a list) in some order to produce a new data structure containing exactly those elements of the original data structure for which a given predicate returns the boolean value true.

    my_filter = filter predicate sequence

## Vlastnosti filtrů

Filtry se dají kombinovat.

F_1 + F_2 = F2 + F1
(F_1 + F_2) + F_3 = F_1 + (F_2 + F_3)
Prvek identita:

## Specification

Specifikace je predikátový objekt definovaný pro určitou skupinu doménových objektů. Reprezentuje
nějakou vlastnost, kterou daný doménový objekt musí splňovat. V případě, kdy ji splňuje vyhodnotí se pozitivně,
Otázka je tedy položena pozitvně, např. Je daná osba dospělá? Používéme ji např. pro filtrování kolekcí z repositories.
Můlžeme je skládat pomocí AND OR, negovat a mít je jako parametr pro repositores!

    AdultPersonSpecification().is_satisfied_by(Person(age=18)) -> true

## Validation

Používáme oproti jedinnému doménovému objektu.

Validace nebo validátor je objekt, kter

    PersonValidator:
        def is_valid(person) -> bool
        def broken_rules(person) -> bool

## Rule

Pravidlo je predikátový objekt, který se vyhodnotí na true pokud je splněn.

    is_met

<https://lostechies.com/jimmybogard/2007/10/24/entity-validation-with-visitors-and-extension-methods/>
<https://github.com/JeremySkinner/FluentValidation>

Lidé, ketré je dobré sledovat:
Phillip Trelford (F#)

<https://confluence.atlassian.com/bitbucket/debug-your-pipelines-locally-with-docker-838273569.html>

## Knihy

## Development

Všechny závislosti vkládat jako parametr funkce, nikoliv skrytě uvnitř používat třídy a funkce z jiných modulů -- konstanty. Pokud je to privátní funkce, třída v témže modulu, pak o tom lze uvažovat.

Pokud funkce vrací kolekci, pak vracím klidně i prázdnou kolekci, nikoliv None.

Pokud funkce vrací objekt, ale ten nemusí být nalezen, pak vracím buď nalezený objekt nebo None. (V jazycích které mají symační typ *Result = Some od x | None*, používáme  ten -- Python tohle nemá, takže tak. (edited)

DDD
<http://danielwestheide.com/talks/flatmap2013/slides/#/7/2>
Aggregates
A cluster of related objects, both entities and value objects
One of the entities is the Aggregate Root
Only the root can be referenced from outside the aggregate
A boundary for transactional consistency
Must ensure that its state never ever violates its business invariants
Outside its boundary, there can only be eventual consistency
Only one aggregate can be modified in a single transaction

Vytvořit osobní dashboard která agreguje data z githubu

Jak sestavit program s GLFW3

package-config
-l

Názvy programů
Ajna -- <https://en.wikipedia.org/wiki/Ajna>

<http://www.dataorienteddesign.com/dodmain/node1.html>
<http://woz.posthaven.com/what-orms-have-taught-me-just-learn-sql>
I've found myself thinking about the database as just another data type that has an API: the queries.

Data Visualisation

<https://www.perceptualedge.com/articles/visual_business_intelligence/save_the_pies_for_dessert.pdf>
<https://www.youtube.com/watch?v=K_mggqkCfIs>
<https://eugenkiss.com/b/overview-of-reactive-gui-programming>

## Jak na docker pull přímo z CircleCI

Potřebujeme instalovat docker-cli přímo při sestavení na CircleCI.

     name: Install Docker client
      command: |
        set -x
        VER="17.03.0-ce"
        curl -L -o /tmp/docker-$VER.tgz https://get.docker.com/builds/Linux/x86_64/docker-$VER.tgz
        tar -xz -C /tmp -f /tmp/docker-$VER.tgz
        mv /tmp/docker/* /usr/bin

Musíme nastavit přihlašovací údaje na dockerhub pomocé environment variables.
    $DOCKER_USER
    $DOCKER_PASS

Sestavíme nový obraz

    docker build -t company_name/project_name:$CIRCLE_BRANCH .

Nahrajeme vytvořený obraz na server `dockerhub.`

    TAG=0.1.$CIRCLE_BUILD_NUM
          docker build -t   CircleCI-Public/circleci-demo-docker:$TAG .      # (4)
          docker login -u $DOCKER_USER -p $DOCKER_PASS         # (5)
          docker push CircleCI-Public/circleci-demo-docker:$TAG

## Dlouhodobé cíle

V nadcházejícím roce máme tyto plány:

Věnovat se JS a to zejména na straně klienta za pomoci knihoven React, Redux a ReasonML.
Věnovat se C++ zejména knihovnám pro práci s počítačovou grafikou.
Věnovat se OCaml a Python na straně serveru.

Faker pro databázová data v Pythinu?
fyo͞om (fume) ... kouř

<https://www.youtube.com/watch?time_continue=144&v=7nAqXYOIoQo>
<https://www.youtube.com/watch?v=dP1xVpMPn8M>

## Kde všude mám účet

**Procvičování programování**

- <https://www.hackerearth.com>
- <https://www.codewars.com>

**Verzování programů**

- github
- bitbucket

<https://sketchfab.com/>

## Knihovny zabívající se grafikou + game engine

<https://github.com/bkaradzic/bgfx>
Cross-platform, graphics API agnostic, "Bring Your Own Engine/Framework" style rendering library.

<https://github.com/dbartolini/crown>
Crown is a general purpose data-driven game engine, written from scratch in orthodox C++ with a minimalistic and data-oriented design philosophy in mind.

## BACKLOG

Zajímavé osobnosti kolem ML/AI
<http://cs.stanford.edu/people/karpathy/>

Tutoriál
<http://blog.overminddl1.com/>

so 11-02

- Redis Like Key-Value Event Sourcing Append Only Database
- Visualisation 2D/3D Eengine with message oriented communication
- Charts and Animation for Analytical software
- Graber obsahu okna pro strojové učení her.
- Log-Structrure Merge Tree (C99)

- nastudovat Single-Writer Principle

Analytické nástroje k prozkoumání: vizualizace + node based prog.

Zajímavé předměty v SIS
Matematické metody v kartografii - MZ370P26

matplotlib is for basic plotting -- bars, pies, lines, scatter plots, etc.

Seaborn is for statistical visualization -- use it if you're creating heatmaps or somehow summarizing your data and still want to show the distribution of your data

Bokeh is for interactive visualization -- if your data is so complex (or you haven't yet found the "message" in your data), then use Bokeh to create interactive visualizations that will allow your viewers to explore the data themselves

### Sites

# DISTANCE METRICS

## Hamming (HAM)

Umožňuje pouze *substitution*.

## Levenhstein (LEV)

Levenshteonova vdálenost se používá pro vyjádření rozdílu respektive podobnosti mezi dvěma sekvencemi.
Nejčastěji se používá pro zjištění rozílů mezi dvěma textovými řetězci. Vzdálenost definujeme jako počet
*deletions*, *insertions* nebo *substituions* nutných k transformaci jedné sekvenci na druhou.

Definice:

|a|, |b|; délka a, b

lev_a,b (|a|, |b|)

Upper/Lower Bounds

1. Její hodnota je nejméně rovna rozdílu délek retězců.
2. Její hodnota je nejvíce rovna délce delšího z řetězců.
3. Její hodnota je rovna nule, pouze když jde o stejné řetězce.
4. Pokud mají řetězce stejnou délku, pak je Hammingova vzdálenost horní hranicí.
5. Vzdálenost mezi dvěma řetězci není větší než součet vzdáleností mezi každým z nich a třetím řetezcem.
   LEV(A, B) <= LEV(A, C) + LEV(B, C)

Příklad kdy je LEV ostře menší než HAM:
    LEV('flaw', 'lawn') = 2: odstraň `f` ze začátku a přidej `n` na konec.
    HAM('flaw', 'lawn') = 4

Algoritmus

pre-conditions: ne

## Damerau–Levenshtein

## Longest Common Subsequence

## Jaro (JAR)

Umožňuje pouze *transposition*.

## Jaro–Winkler (JAW)

Foraminifera (dírkovci)

Planktón
    žijí v hloubkách 50 až 100m
    na dně oceánu tvoří sníh ... souvisí s rozpustností Ca v různých hloukách?

    jednokomůrkové vs mnohokomůrkové schránky

    Stratigrafie
    kamrium až recent
    rozvoj devonu
    ve spodní juře -- planktonické formy

Radiolária (mřížovci)

Mají kostru vnitř buňky.

Chov planktonu je velmi složitý.

Ctenophora Žebernatky
    zdroj světla, luminiscence

Zavést tox,ini...
Vyzkoušet landscape.io

Prohlédnout strukturu projektu:
<https://github.com/django/django/>

Prohlédnout strukturu projektu:
<https://github.com/facebook/react-native/>

<https://github.com/CircleCI-Public/circleci-demo-python-flask/blob/master/.circleci/config.yml>

Přečíst dokumentaci:
<https://circleci.com/docs/2.0/workflows/>

Napsat skript který iteruje přes všechny git tagy a rozdělí projekt do adresářu podlel tagů.
Výukové účely ... můžeme krokovat po projektu.

Můj setup pro ReasonML/BuckleScript

Struktura projektu

    lib/
        js/
            Main.js
    public/
    src/
        Main.re

<https://en.wikipedia.org/wiki/Mirage>
<https://johnresig.com/blog/building-art-history-database-computer-vision/>
<https://github.com/rust-lang-nursery>
<https://github.com/rust-lang-nursery/error-chain>

C UDP/TCP Socket programming
Logging Server něco jako statd
Event Loop něco jako Disrupter.

## References

- <http://www.paulbourke.net/dataformats/tga/>
- <http://www.paulbourke.net/dataformats/ppm/>
- <https://www.root.cz/clanky/graficke-formaty-ve-znameni-unixu/>
- <https://www.root.cz/clanky/graficky-format-tga-jednoduchy-oblibeny-pouzivany/>

CQRS a REST
<https://www.infoq.com/articles/rest-api-on-cqrs>

Guideline -- převzít
<https://github.com/wearehive/project-guidelines#api-design>

# Rešerše

| Name                                                                      | Language   | Category    | Description  |
|---------------------------------------------------------------------------|------------|-------------|---------------
| [cgmath](https://github.com/brendanzab/cgmath)                            | Rust       | CG Library  |
| [vcglib](https://github.com/cnr-isti-vclab/vcglib)                        | C++        | CG Library  |
| [s2geometry](https://github.com/google/s2geometry)                        | C++        | CG Library  |
| [cudgl](https://github.com/timthirion/cudgl)                              | C++        | CG Library  | A experimental renderer in C++14 and modern OpenGL
| [scirust](https://github.com/indigits/scirust)                            | Rust       | Science     |
| [nalgebra](https://github.com/sebcrozet/nalgebra)                         | Rust       | Algebra     |
| [MeshLab](http://www.meshlab.net/)                                        | C++        | CG Tool     |
| [Xenko](https://git.xenko.com/xenko/Xenko-Runtime)                        | C#         | profi       |
| [Pomdog](https://github.com/mogemimi/pomdog)                              | C++        | hobby       |
| [Torque3D](https://github.com/GarageGames/Torque3D)                       | C++        | profi?      |
| [AtomicGameEngine](https://github.com/AtomicGameEngine/AtomicGameEngine/) | C++        | profi?      |
| [Natron](https://github.com/MrKepzie/Natron)                              | C++/Python | FX Tool     | Open-source compositing software. Node-graph based.

<https://github.com/google/mathfu> | C++ | Geometry

<https://github.com/google/motive> | C++ | Geometry

<https://github.com/boostcon>

<https://en.wikipedia.org/wiki/Automatic_programming>

<http://www.euclideanspace.com/maths/algebra/vectors/index.htm>

<https://wiki.sei.cmu.edu/confluence/pages/viewpage.action?pageId=88046338>

<http://exercism.io/languages/rust/exercises>

<https://github.com/yuanming-hu/taichi> | C++ | Geometry + Render

<https://github.com/nyorain/nytl/blob/master/nytl/vec.hpp>

<https://github.com/PX4/Matrix/blob/master/matrix/Scalar.hpp>
<https://github.com/servo/euclid/>                | Rust | Geometry
<https://github.com/Vectorious/geom-rs/>          | Rust | Geometry
<https://github.com/I3ck/rust-3d/tree/master/src> | Rust | Geometry
<https://github.com/I3ck/lib_2d/>                 | C++  | Geometry
<https://github.com/AdamNiederer/faster>          | Rust | SIMD
<https://github.com/BurntSushi/quickcheck>        | Rust | Testing
<https://codeascraft.com/2011/02/15/measure-anything-measure-everything/> | Devblog
<https://github.com/qt/qtbase/tree/3fe74b76fd0eaf39d4c6681e2edca5adbf107883/src/gui/math3d> | C++ Geometry
<https://github.com/boostorg/hana/blob/master/include/boost/hana/any_of.hpp>

sudo apt-get install libgmp3-dev

# Jak psát dokumentaci?

<http://www.writethedocs.org/guide/>

[BBC Rise of Animals 1/2 From the Seas to the Skies - David Attenborough](https://www.youtube.com/watch?v=ZxsHYybjixI)
[BBC Rise of Animals 2/2 Dawn of the Mammals - David Attenborough](https://www.youtube.com/watch?v=gbzEL_X_xbg&t=1821s)
[BBC Pterosaurs - David Attenborough](https://www.youtube.com/watch?v=aHbizy7g56Q)
[BBC Natural World - David Attenborough](https://www.youtube.com/watch?v=cVCxkHp8O4M)

# DEVELOPMENT GUIDE

Příručka pro vývoj a správu softwarových projektů.

TODO Napsat skript, který z organizace na bitbucket.org zjistí statistiky o projektech, vytvoří přehled a sumariazaci z README.

# Co chceme?

Mít pořádek a nezabývat se věcmi, které mohou být automatizovány.

# Proč to chceme?

Chceme zamezit chybám a ztrátě času, které vznikají při manuální správě procesů.

# Jak toho dosáhneme?

Procesy, které chceme automatizovat musíme popsat a najít nástroje, které řeší daný problém.

# Co potřebujeme

Jako analytik potřebuji mít přehled:
    Záznamy, které byly získány, kolik jich bylo validních a případně proč byla nevalidní.
    Změny v registru osob.
    Kdy byly vytvořeny analýzy.

Pro automatizaci nebo sestavování projektů používáme GNU Make a GNU Bash.

## GNU Make

Pročtěme si prosím dokumentaci i nějaký krátký praktický tutoriál, případně vytvořmě pár vlastních ukázkových šablon.

<https://www.gnu.org/software/make/manual/html_node/index.html>
<http://makefiletutorial.com/>
<https://wiki.cdot.senecacollege.ca/wiki/Make_and_Makefiles>
<http://www.adp-gmbh.ch/cpp/gcc/create_lib.html>

## Kontrolní otázky

Jaký je rozdíl mezi `:=` a `=` pro proměnné?

Zapamatuj si:

    $@ název cíle
    $< první prerekvizita
    $^ všechny prerekvizity

    $(addsuffix ...)
    $(join ...)
    #$(patsubst %.cpp, %.o, $(wildcard *.cpp))

    $(OBJECTS): %.o: %.cpp
    g++

Jak vytvoříme objekt

    some.o: some.cpp some.hpp
        ${CXX} ${CPPFLAGS} -c some.cpp

lépe

    some.o:

## GNU Bash

<https://www.gnu.org/software/bash/manual/html_node/index.html>

Soupis nástrojů/knihoven nutných zejména pro práci.

# ROZHLAS DEVELOPMENT

# Scénáře

Jako vývojář

Aplikace spouštíme jako Docker kontejnery.

Sjednotit strukturu projektů.
Sjednotit README a dokumentaci.
Sdílet spouštěcí a konfigurační skripty.
Jakým způsobem zavádět novou funkcionalitu?
    Kdo je zodpovědný za formulaci zadání?

Zavést git-hooks, sémantické verzování, autmatický build a deploy -- jak knihoven tak aplikací (Docker).

Projekty

Plán:

Vytvořit řetězec služeb, které komunikují pouze přes HTTP (REST).
Pro všechny služby vytvořit webové rozhraní pro správu a dohled.
Služby by měli být přístupné pro různé uživatelské role (administrátor, editor, atd).
Každá služba by měla mít odpovídající databázi jen ona s ní může pracovat.

Výhody:
Každá služba může používat jiný jazyk i datové úložiště.
Služba dělá jen jednu věc a dělá ji dobře.

Nevýhody:
Služby tvoří závislý graf a v testech musíme služby mockovat.

Každá služba bude mít API pro přístup k:

- URL např `avo.cro.cz/registr`
- identifikátor
- jméno, popis, verze
- čas běhu (uptime)

Aura Main
Knihovna a (zatím) konzolový program pro čištění a identifikaci zázánamů respondentů oproti registru osob.

Aura Viewer
Aplikace zobrazující vyskyty respondetů ve vysílání.

Aura Register
Knihovna a webová aplikace pro správu registru osob, který slouží k identifikaci respondentů ve vysílání.

# README #

Skripty pro vývoj a správu projektů a aplikací.

## Hooks

- Zamezit push do větve `master` nebo `release`.
- Před každým `pushem` spustit jednotkové testy a kontrolu stylu.

## Scripts

- Vytrvoř virtuální prostředí v aktuálním adresáři.

- Naistaluj závislosti do aktivního virtuálního prostředí.

- Zjisti, jestli se nacházíme ve virtuálním prostředí.

- Smazat `__pycache__/`

## Jak postupujeme při vývoji

Nejdříve hrubě popíšeme požadavky a snažíme se porozumět doméně, ve které se pohybujeme.
Zřejmě půjde o diskuzi typu: "Ctěl bych, aby aby, když vytvořím objednávku, tak abych ji někde viděl, že ještě enní odbavená". Z takového požadavku, začneme vybírat slova, která budou tvořit základ našeho slovníku jako např.:
objednávka, odbavená objednávka, vytvořit objednávku.

== Pravidla vývoje

Všechny citlivé údaje jako jsou uživatelská hesla a jména nesmí být součástí zdrojových souborů.
Takovéto údaje nastavujeme přes proměnné prostředí na lokálním nebo vzdáleném stroji či službách jako Bitbucket Pipelines.

Každá nová funkcionalita nebo úprava stávající je podložena use casem, který ji jasně popisuje. Z tohoto popisu musí být zřejmé co se má testovat a co může být akceptováno jako řešení. Každá nová funcionalita musí být vytvářena na samostané větvi s nějakým číslem pro automatické uzavření *issue* např.: `feature/#99/login-form`.

Pro každou dopracovanou větev se vytváří *pull request*, který musí zkontrolovat jiný vývojář.
Před samotnou kontrolou musí být projít všechny testy, které se spouští automaticky na serveru při každém commitu.

# Styl

    root = true

    [*.{c,cpp,h,hpp}]
    indent_style = space
    indent_size = 4
    end_of_line = lf
    charset = utf-8
    insert_final_newline = true

## Verzování

## Nasazení

## Balíčkování

<https://the-hitchhikers-guide-to-packaging.readthedocs.io/>

## Testování

Každá entita musí být otestována na equlitu, která je definována pomocí ID.
Každá hodnota musí být otestována na equalitu, která je definována pomocí atributů.
Každá hodnota by měla být immutable!

Rozdělení:

- Unit tests
- Integration tests
- End-to-End tests

## Jednotkový test

## Integrační test

Slouží k testování *services*.
O integrační test jde když se v kódu objeví:

- zápis a čtení databáze
- zápis a čtení souborového systému
- komunikace po síti, jako např odeslání emailu, FTP

## Rozdělení projektů

Knihovny můžeme rozdělit na doménové, které obsahují doménový model a  a a servisní.
V případě doménových knihoen si vystačíme pouze s jednotkovými testy.
Pokud se však jedná o servisní knihovnu, můžeme potřebovat integrační testy, které pracují se soubory, databází, HTTP, FTP atd.

Jako vývojář, pokud vytvořím commit na vývojové větvi, pak se spustí automatické sestavení na serveru.
Součástí sestavení je spuštění jednotkových i integračních testů

Pokud je náš projekt aplikace budeme ji ve velké většině případů distribuovat jako Docker kontajner.

== Docker krok za krokem

Můžeme se pohybovat ze stavu S1 do stavu S2 aniž bychom znali interní reprezentaci tohoto stavu.
Jeninné co musíme umět je zobrazit tento stav. Pokud je ale S nějaký velký objekt, pak se může hodit
posílat jen rozdíl dS mezí stavem S1 a S2, kdy platí že S1 + dS = S2. To ale znameá, že musíme vědět jak takový stav vytvořit aplikováním nějaké změny. Příkladem může být animacem kdy máme výchozí obraz a následující obraz a prostě jen přejdem od obrazu 1 k obrazu dva. Animace ale může být definováná jako Scéna na kterou jsou aplikováni změny tedy ....

Poznámky pro práci s pytest

Jak spustit testy označené určitým dekorátorem

<https://docs.pytest.org/en/latest/example/markers.html>

Marker registrujem v pytest.ini

PROJEKT "EXPERIMENT"

Pokud se budeme snažit popsat, jak probíhá experiment, zřejmě záhy zjistíme, že má nějaký počáteční a koncový stav.
Počáteční stav je většinou model nějaké situace, přírodního procesu, který se snažíme zkoumat a na tento stav působíme -- v nejjednodušším případě nám stačí čas. V momentě kdy experiment ukončíme, snažíme se tento konečný stav zhodnotit, např jestli odpovídá námi předpovídanému stavu a pokud ne, čím to bylo způsobeno. Z pohledu DDD vidíme, že Experimet má životní cyklus -- je stavový a také že můžeme mít experimenty stejného druhu, které se pak snažíme porovnat navzájem. Polovina experimentl např může skončit podle očekávání a druhá polovina nikoliv.
I
Popis struktury

    doménové knihovny -- obsahuje pouze unit testy (doménový model/doménové servisní funkce)
    servisní knihovny -- obsahuje integrační testy (REST)
    webové aplikace   -- obsahuje end-to-end test  (Flask)

Jak se ověřuje efenkivita při psaní knihovny?

## Co potřebujeme sjednotit

[ ] sémantické verzování (praktické ukázky pro různý druh projektů)
[ ] feature branching / pull requests / reviews

### Webová aplikace

[ ] definovaná souborová a adresářová struktura (flask)
[ ] sjednocená barevnost
[ ] hlavička -- logo rozhlasu, odkaz na hlavní (informativní) stránku oddělení
[ ] patička -- copyright, další informace a odkazy

### Servisní knihovna REST

[ ] dokumentace REST rozhraní (Swagger)
[ ] zápis a organizace testů REST rozhraní

LateX dokumentace

---

### Doménová knihovna

- Knihovna nesmí pracovat s externími zdroji např. databáze, zapisovat a číst ze souboru, používat síť atd.
- Všechny testy jsou jednotkové.

### Servisní knihovna

## Ukázkový postup

- Stáhneme repozitář a přemístíme se do něj.
Pokud je třeba, pak si stáhne *docker image* pro vývoj.

--

## Python specific

- Upload package to PyPi that we can use it in other projects.
- We use [PyCodeStyle](https://pycodestyle.readthedocs.io/en/latest/) for checking the style and convetions

## C++ specific

Vytvořit jednotnou šablonu pro projekty -- viz balíček Scaffold
    - šablona pro pure C++ projekt
    - šablona pro pure Python projekt
    - šablona pro C++/Python projekt
    - šablona pro Python/C++/Rust projekt

- Začít používat clang a clang-format.
- Napsat makra pro generováni hash a equal v C++

## Docker

We need some Docker Image Registry and Service

- [Docker Hub](https://hub.docker.com/)
- [Microsoft Azure Container Registry](https://azure.microsoft.com/en-us/services/container-registry/) integrované s [Microsoft Azure Container Service](https://azure.microsoft.com/en-us/services/container-service/)
- [Amazon EC2 Container Registry](https://aws.amazon.com/ecr/) integrované s [Amazon EC2 Container Service](https://aws.amazon.com/ecs/)

 Projekty máme na bitbucket.com a používáme pipelines. Pomocí pipelines můžeme vytvořit pso úspěšném otestování docker image a udělat push do registry.

 <https://blog.bitbucket.org/2017/04/18/bitbucket-pipelines-supports-building-docker-images-and-service-containers/>

 <https://hub.docker.com/r/uetoyo/nao/>

    docker login <REGISTRY_HOST>:<REGISTRY_PORT>
    docker tag <IMAGE_ID> <REGISTRY_HOST>:<REGISTRY_PORT>/<APPNAME>:<APPVERSION>
    docker push <REGISTRY_HOST>:<REGISTRY_PORT>/<APPNAME>:<APPVERSION>

Založit Google kalendář a propojit se Slackem.
Nainstalovat Slack a Trello pro Věra Chmelarová.
Analýza iRozhlas.cz, diskuze v pondělí.

Rozdělení validace na jednotlivé kroky.
Zapsání validace do rozhodovací tabulky.

Value Object
    Single Value Object

        Categorical (Nominal)
        Ordinal
        Interval (Range)

        StringValueObject
        NonEmptyStringValueObject
            EmailValueObject
        NumericValueObject

    Multi Value Object

    Comparable Value Object => Sortable Value Object

Pravidla pro zvřejnení hodnotového objektu v entitě:

    Pokud jde o single value object, můžeme vracet přímo hodnoty objektu.

Pokud je value object finální pak preferuj `other instanceof T` jinak `other.getClass() == getClass()`

Java

Každý balíček obshuje soubor `package-info.java`.

    // Experiment with reflection.
    // (Code) Entry.<String>getNullOrSingleValueObjectInstance (Code.class, code),
    private static <T> Object getNullOrSingleValueObjectInstance(final Class<?> clazz, T value)  {
        try {
            return value == null ? null : clazz.getClass().getConstructor().newInstance(value);
        } catch (InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException
                | NoSuchMethodException | SecurityException e) {
            throw new RuntimeException(e);
        }
    }

# Úkoly

- Naučit se navrhovat dobré konzolové rozhraní např pomocí `docopt`.
- Zapojit Vega grafy do analýz.
- Používay IPython pro testy a repoerting možná dashboard?
- Prostuduj možnosti SQLite + Python

GLFW Python binding, který funguje

- <https://github.com/pyglfw/pyglfw>
- <https://bitbucket.org/pyglfw/pyglfw>

GLFW C#/.NET  binding

Python Setup.py
Zkontroluj, že find_packages najde to samé co explicitně uvedeš.

<https://github.com/audreyr/cookiecutter-pypackage/blob/master/setup.py>
<https://github.com/smarie/python-pytest-cases/blob/master/setup.py>

## Workflow a Task managment

### Patterns
<http://www.workflowpatterns.com/patterns/control/basic/wcp1.php>

### Projects
<https://github.com/knipknap/SpiffWorkflow/tree/master/SpiffWorkflow>

<https://io.made.com/repository-and-unit-of-work-pattern-in-python/>

Aplikace vizualizující počasí a klima

<https://www.windy.com/>
<https://www.ventusky.com/>
<https://earth.nullschool.net/>

<https://github.com/akshaysonvane/Climate-Change-Data-Analytics-Visualization>

ende neu
<https://www.youtube.com/watch?v=MXXT7uvQp7E>
<https://www.youtube.com/watch?v=ndK3BM77o5s>
<https://www.youtube.com/watch?v=ZSeQ-NqGISY>
<https://www.youtube.com/watch?v=0kOmPaGgfZI>

## PLÁN ##

### 2018-06

- Business rules: Jak je zapisovat a spravovat?
- Prozkoumat redis a celery

## API ##

- <https://www.quora.com/Are-there-open-APIs-for-air-pollution-data>
- <https://www.airvisual.com/world>
- <https://openaq.org/#/map?_k=15sn6s>
- <https://openaq.org/#/map?_k=15sn6s>
- <http://portal.chmi.cz/files/portal/docs/uoco/isko/grafroc/16groc/gr16cz/Obsah_CZ.html>

## CO JSEM PŘEČETL

2018-05-08
<http://blogs.ei.columbia.edu/2014/07/11/what-geology-has-to-say-about-global-warming/>

2018-05-09
<https://www.sciencedaily.com/releases/2018/05/180507153141.htm>

crust -- kůra
mantle -- plášť
lithosphere -- crust + upper mantle

nyní: 7 hlavních a vícero menších desek
pohyb ruchlostí růst nehtů nebo vlasů
jiné planety nemají plate tectonics

Snowball Earth -- 700 mil. ago

Pro práci s OpenGL budeme potřebovat  mesa-utils

    sudo apt install mesa-utils

Zkontrolujeme verzi ovladače:

    glxinfo | grep OpenGL
    glxinfo | grep "OpenGL version"

WebGL

## Rovnice Wolfram Alpha

    integrate e^(-2x)sin(3x)dx
    integrate e^(-2x) sin(3x)
    integrate (3-x)log^2(x)
    integrate ((sqrt acos(x))/sqrt(1-x^2)

    Úkol 4

    integrate ( 6x + 5sqrt(x) + 81 ) / ( (sqrt(x) - 3)(x +16) (sqtr(x)))
    integrate ( 5x + 13 ) / ( (x + 2)^2(x^2 + 4x + 5))
    integrate (-4e^(2x)+11e^x-6) /((e^x-1)(2-3e^x))

Groundwater oxygen isotope anomaly before the M6.6 Tottori earthquake in Southwest Japan
<https://www.nature.com/articles/s41598-018-23303-8>

Long-range dependence in earthquake-moment release and implications for earthquake occurrence probability
<https://www.nature.com/articles/s41598-018-23709-4>

Generalized Earthquake Focal Mechanism Classification
<https://www.youtube.com/watch?v=uT0Nkf0BA7o>

<https://www.youtube.com/watch?v=zwAD6dRSVyI>

Diplomka
========

Rotating convective turbulence in Earth and planetary cores

<http://www.dlr.de/pf/en/desktopdefault.aspx/tabid-8644/14907_read-37085/>
<https://www.sciencenews.org/article/spinning-core>

<https://www.researchgate.net/publication/7487267_Simulation_of_equatorial_and_high-latitude_jets_on_Jupiter_in_a_deep_convection_model/figures?lo=1>
<http://www.cambridge.org/gb/academic/subjects/mathematics/fluid-dynamics-and-solid-mechanics/turbulence-rotating-stratified-and-electrically-conducting-fluids?format=HB&isbn=9781107026865#mp49L02PQLJTCSvR.97>
<http://www.cambridge.org/gb/academic/subjects/mathematics/fluid-dynamics-and-solid-mechanics/theory-and-modeling-rotating-fluids-convection-inertial-waves-and-precession?format=HB#2eJ1Do52a8Baxe41.97>
<http://www-vortex.mcs.st-and.ac.uk/strat.html>
<https://www.nature.com/articles/289393a0>
<https://www.nature.com/articles/nature13122?foxtrotcallback=true>
<https://landsatlook.usgs.gov/viewer.html>

<https://www.nature.com/articles/srep22473>
<https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4040578/>

<https://www.amazon.com/Earths-Inner-Core-Observational-Seismology/dp/1107037301>

<http://vixra.org/author/m_d_sheppeard>

Seismologists noticed that waves appear to travel faster through the inner core from north to south than from west to east.
Seismologové zjistili, že vlny procházejí rychleji skrze vnější jádro ze severu na jih než ze západu na východ.

Seismic properties also seemed to vary between the Eastern and Western hemispheres of the globe.
Seizmické vlastnosti se také mění mezi výchidní a západní hemisférou.

PREM -- Preminilary Reference Earth Model

# Install Rust toolchain

curl <https://sh.rustup.rs> -sSf | sh

# VSCode
<https://code.visualstudio.com/docs/?dv=linux64_deb>

# Dropbox Headless Install via command line

# <https://www.dropbox.com/install-linux>

    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    ~/.dropbox-dist/dropboxd

# Install latest cmake

ADD <https://cmake.org/files/v3.7/cmake-3.7.2-Linux-x86_64.sh> /cmake-3.7.2-Linux-x86_64.sh
RUN mkdir /opt/cmake
RUN sh /cmake-3.7.2-Linux-x86_64.sh --prefix=/opt/cmake --skip-license
RUN ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake
RUN cmake --version

//////////////////////////////////////////////////////////////////////////////
ÚKOLY
//////////////////////////////////////////////////////////////////////////////

[-] Zaveď sémantické verzování pro všechny projekty.
[-] Napiš skript pro automatické denní zálohy databáze.

//////////////////////////////////////////////////////////////////////////////
STUDIUM
//////////////////////////////////////////////////////////////////////////////

HTTP 1/2 protokol
GNU Make
CMake
Maven
SBT
Okasaki
State Machine -- teorie
State Machine -- knihovna boost
Grafové algoritmy -- teorie
Grafové algoritmy -- knihovna boost

//////////////////////////////////////////////////////////////////////////////
OTÁZKY
//////////////////////////////////////////////////////////////////////////////

Dá se aplikovat stavový automat na game-of-life?

//////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////
SLEDOVAT
//////////////////////////////////////////////////////////////////////////////

[Bruce Eckel](http://bruceeckel.github.io/)

//////////////////////////////////////////////////////////////////////////////
PŘEBRAT
//////////////////////////////////////////////////////////////////////////////

OK: Scala Linked List Započato
OK: Scala JS Tutoriál Započato

<https://www.gnu.org/software/make/manual/html_node/Pattern-Intro.html#Pattern-Intro>
<https://ericlippert.com/2016/12/05/excessive-explanation-part-two/>
<http://www.cs.cmu.edu/~rwh/theses/okasaki.pdf>
<https://mauricio.github.io/2013/11/25/learning-scala-by-building-scala-lists.html>
<https://www.safaribooksonline.com/library/view/ml-for-the/9781107263772/html/9780521565431_01_hlf.html>

== HRA ===
Hra *Equlibrum*; jejím cílem je dosáhnout rovnováhy.
Hra je rozdělena na vrstvy: moře, země, vzduch, oběžná dráha.
Proti sobě jsou čtyři mocnosti, které bojují o zdroje a moc.
Úkolem hry je dosáhnout vurovnaného stavu, který je výhodný pro všechny strany
a žádná ze stran nepociťuje nevýhodu.

Nápady:
Navrhni programovací jazyk -- funkcionální, kde všechno je uzel, kerý je součástí flow.
Podívej na:
<http://www.luna-lang.org/>
Virtuální machina sbírá onformace a pak zkompiluje program s optimalizacemi...

[O] Dopracuj 1. zpùsob implementace želví grafiky podle: <https://fsharpforfunandprofit.com/posts/13-ways-of-looking-at-a-turtle/#way1>
[O] Zapiš a doplò, jak se zapisují komentáøe v `.bat` souborech: `::` vs `@rem`.
[O] Zjisti, co znamená `call %~dp0env.bat` (~dp0) nebo `%WINPYDIR%\python.exe qtdemo.py %*` (%*).
[O] Rozvrhi èlánek o implementaci šablonové tøídy v C++ zejména vhodnou pro potøeby CG.
[O] Zjisti jaký je rozdíl mezi system/user variables na Windows.
[O] Pøiprav rozvrh pro sebevzdìlávání: machine-learnning; lineární algebra; funcionální programování
[O] Pøeèíst pozdìji Eiffel: <https://wolandscat.net/2011/07/03/352/>
[O] <https://github.com/Ericsson/eiffel/blob/master/introduction/introduction.md>
[O] Dokoukat C++ lambdas: <https://www.youtube.com/watch?v=_1X9D8Z5huA&index=1&list=TLGGIWVQPvwhTQ0xNDExMjAxNg>
StateMachine
<http://stackoverflow.com/questions/14676709/c-code-for-state-machine>
<https://github.com/MassTransit/Automatonymous/blob/master/src/Automatonymous/States/StateEventFilter.cs>
<http://joshkodroff.com/blog/2015/08/21/an-elegant-abandoned-cart-email-using-nservicebus/>
<https://github.com/Domo42/saga-lib/wiki/Sagas>

SCALA Knihovny z Github Trendings
---------------------------------
<https://github.com/azakordonets/fabricator>
Fabricator is a minimalist generator of random strings, numbers, etc. to help reduce some monotony particularly while writing automated tests or anywhere else you need anything random. It's written on scala but fully backward compatible with Java.

<https://github.com/whisklabs/docker-it-scala>
Set of utility classes to make integration testing with dockerised services in Scala easy.

<https://github.com/vegas-viz/Vegas>
The missing MatPlotLib for Scala + Spark

<https://github.com/docopt>
<https://github.com/docopt/docopt.cpp>
<https://github.com/docopt/docopt.scala>

JAVA Knihovny
-------------
<https://immutables.github.io/>
<http://www.objectaid.com/>
=== Knihy
Patterns of Enterprise Application Architecture; Fowler M.
Woking Effectively with Legacy Code.
Java Concurrency in Practice.
Peopleware; Tom Demarco
Effective Java by Joshua Bloch. The Pragmatic Programmer is like a dictionary.
Design Patterns Book by the Gang of Four
Refactoring; Fowler
Clean Code by Robert C
The Clean Coder. Robert C. Martin
 Test Driven Development by Kent Beck.

=== Rust
<https://www.rust-lang.org/ides.html>
<https://llogiq.github.io/2016/02/28/java-rust.html>
<https://michaelwoerister.github.io/>

=== Idris
<http://docs.idris-lang.org/en/latest/tutorial/starting.html>

=== Haskell
<http://dev.stephendiehl.com/fun/>

=== C++

<http://blog.coldflake.com/posts/Android-style-Message-Passing/>
<http://blog.coldflake.com/posts/Testing-C++-with-a-new-Catch/>
<http://blog.coldflake.com/posts/C++-delegates-on-steroids/>
<http://www.informit.com/articles/article.aspx?p=1852519>
<http://en.cppreference.com/w/cpp/container/vector>
<http://en.cppreference.com/w/cpp/language/dependent_name>
<http://www.cprogramming.com/tutorial/3d/theBasics.html>
<http://www.cprogramming.com/c++11/c++11-lambda-closures.html>
<http://www.codeproject.com/Articles/11015/The-Impossibly-Fast-C-Delegates>
<http://www.codeproject.com/Articles/616090/Delegates-Cplusplus-vs-Impossibly-Fast-A-Quick-a>
<http://www.codeproject.com/Articles/570638/Ten-Cplusplus-Features-Every-Cplusplus-Developer>
<http://www.cplusplus.com/reference/deque/deque/?kw=deque>
<http://www.codinglabs.net/tutorial_CppRuntimeCodeReload.aspx>
<http://erdani.com/publications/cuj-2005-08.pdf>
<http://www.josuttis.com/libbook/stl/deque1.cpp.html>
Do the parentheses after the type name make a difference with new?
Why use non-member begin and end functions in C++11?

<https://blogs.msdn.microsoft.com/oldnewthing/20061214-02/?p=28713>

=== Java/Scala
<http://www.codecommit.com/blog/java/techniques-of-java-ui-development>
<http://debasishg.blogspot.cz/2010/09/domain-models-thinking-differently-in.html>

=== Other
<http://www.howtogeek.com/>

<http://tomasp.net/blog/type-first-development.aspx/>
<http://www.bloomberg.com/graphics/2015-paul-ford-what-is-code/>
<http://www.defmacro.org/ramblings/fp.html>
<https://blog.8thlight.com/uncle-bob/2012/08/13/the-clean-architecture.html>

<https://medium.com/@kvnwbbr/a-journey-into-reactive-streams-5ee2a9cd7e29#.jkcbwuwd0>

=== Agile
<http://www.agilemodeling.com/artifacts/robustnessDiagram.htm>
<http://learndatamodeling.com/blog/logical-data-modeling-tutorial/>

<http://thedatafarm.com/> -- Julie Lerman

Duck Typing
Structural Typing
Monkey Patching
Higher-order functions
Closure
Currying

Covariance and Contravariance in Scala

Kovariance
    less specific type to

Assignment compatibility:
    Zvíře z = B() -> bizon
    Zvíře z = Z() -> zvíře

Kovariantní!

C/C++
<https://gustedt.wordpress.com/2015/04/25/demystify-undefined-behavior/>

Projekty

Sockety/HTTP komunikace v C/C++/Rust/Python
RPC/Serializace v C++/JS/Rust/Python
    Captain-Proto

WebGL/OpenGL

github.com/GeoKit
    Minmalistický geometrický balíček.

StateMachine Library po vzoru Qt; Ragel

=== C++
    Sekvenční kolekce: vector; deque

std::vector --

Kolekce představuje tzv. dynamické pole, které před vložení prvku, který by se
nevešel do této kolekce, zvětší automaticky pole (většinou jde o dvojnásobek).
Při vytvoření vektoru, můžeme udat jeho počáteční kapacitu; tím zamezíme zbytečné
alokaci místa, pokud dopředu víme, že vektor zřejmě nepřekročí námi předpokládanou
velikost. Vektor také umí vrátit přebytečné místo zpět pomocí metody `shrink_to_fit()`.

reserve()

Náhodný přístup k prvku O(1)
Přidání/odebrání prvku na konec O(1)
přidání/odebrání prvku obecně O(K), kde K je vzdálenost od konce.

Kde alokuje vektor paměť, na haldě nebo na zásobníku?
Vektor alokuje ve výchozím stavu paměť na haldě.
Přesně řečeno je paměť alokována pomocí zadaného alokátoru, jež má výchozí hodnotu
alokovat na haldě viz <http://www.cplusplus.com/reference/memory/allocator/allocate/>

----------------------------
public member functions:
        constructor
        destructor
        operator=
        assign
        get_allocator
    Element access
        at
        operator[]
        front
        back
        data (C++11)
    Iterators
        begin/cbegin
        end/cend
        rbegin/crbegin
        rend/crend
    Capacity
        empty
        size
        max_size
        reserve
        capacity
        shrink_to_fit (C++11)
    Modifiers
        clear
        insert
        emplace (C++11)
        erase
        push_back
        emplace_back (c++11)
        pop_back
        resize
        swap
    Non-member functions
        operator==
        operator!=
        operator<
        operator<=
        operator>
        operator>=
        ^^ lexicographically compares the values in the vector
    std::swap(std::vector)

specializes the std::swap algorithm
(function template)

=== Rust
std::vec::Vec<T>
Paměť je alokována na haldě (heap-allocated).

Explicitní vytvoření (deklarece)
    let v : Vec<i32> = Vec<T>::new();

Pomocí makra

## PYTHON

<http://setuptools.readthedocs.io/en/latest/index.html>
Pro instalaci závislostí a to produkčních i vývojářských nepotřebujeme kromě souboru `setup.py`.
Sledovat <https://github.com/pypa/pipfile>

## C/C++

<https://github.com/bast/gtest-demo>

# NÁVOD NA ŽIVOT

# Fyzika pevných látek

## Dielektrikum, Ferroelektrikum

## Maxwellovy rovnice

1. Zákon celkového proudu
2. Gaussův zákon elektrostatiky
3. Zákon elektromagenetické indukce
4. Zákon spojitosti indukčního toku

polarizace
pbjemová hustota

makroskopické elektrické pole

depolarizační pole

susceptibilita
permeabilita

Lokální elektrické pole na atomu

## Edukativní videa

Biologie

- <https://www.youtube.com/channel/UCKzJFdi57J53Vr_BkTfN3uQ>

Matematika

- <https://www.youtube.com/channel/UCYO_jab_esuFRV4b17AJtAw>

Grafy - Python

<https://github.com/bendichter/brokenaxes>

Serializace C++
<https://github.com/USCiLab/cereal>

Physics Engine C++
<https://github.com/MADEAPPS/newton-dynamics>

Algebras
<https://github.com/tensor-compiler/taco>

## Knihovny

<https://github.com/blitzcode/hackage-diff>
Compare the public API of different versions of a Hackage library
Nešlo by něco podobného udělat pro Python?
Například bychom mohli také nabízet zvětšení verze pokud se API bapíku změní při vývoji!

## Algorithms and Data Structures

- <https://www.cs.usfca.edu/~galles/visualization/>

## JS Resources

<http://2ality.com>
<https://medium.com/javascript-algorithms>

## C++

Resources

<https://github.com/brandonpelfrey/Fast-BVH>
<https://github.com/brandonpelfrey/SimpleOctree>
<https://github.com/brandonpelfrey>
<https://github.com/brandonpelfrey/Volume-Rendering-Tutorial>

<https://github.com/TheLartians/Visitor>
<https://github.com/rukkal/static-stl>

## Custom Programming Language

Create programming language from scratch.

- compile or transpile to JS
- functional or object oriented
- static vs dynamic

### Glossary

Lexer

Parser

Lexeme

token

terminal

nonterminal

Parse Tree

Chomsky Grammar Levels

Level-3: Regular Grammar
Level-2: Context-Free Grammar
Level-1: Context-Sensitive Grammar
Level-0: Unrestricted Grammar (Recursively Enumerable Grammar)

EBNF

Reference: Batenburg, FHD van, Gittenberger, E: Ease of fixation of change in coiling: computer experiments on chirality in snails. Heredity 76 (1996): 278-286.

Reference: Øritsland, Nils A., 1990: Starvation survival and body composition in mammals with particular reference to homo sapiens. Bulletin of Mathematical Biology 52, No. 5, 643-655.

Evolutionary research:
J for exploration of speciation
by: Eke van Batenburg, research scientist of Institute Theoretical Biology, Leiden, Holland

## How to cite

Bibliography Entry for a Book

Format: Author’s last name, first name. Book Title. Place of publication: publisher, date of publication.

Example:

- **A book with one author**: Hartz, Paula. Abortion: A Doctor’s Perspective, a Woman’s Dilemma. New York: Donald I. Fine, Inc., 1992.

<http://www.iresearchnet.com/how-to-write-a-research-paper/>

---

sudo rm -rf .venv/

## Scala Libraries

- <https://github.com/fthomas/refined>
- <https://github.com/vivri/Adjective>

## State Machines Resources

- <https://statecharts.github.io/>
- <https://github.com/davidkpiano/xstate>
- <https://medium.freecodecamp.org/how-to-visually-design-state-in-javascript-3a6a1aadab2b>

#### REST API Overview

    http://localhost:5000/data/public.source?
        select=topic_one,topic_two
        &aggregate=duration
        &function=sum
        &group=topic_one,topic_two
        &order=agg%20desc

    - select
    - group
    - aggregate
    - function
    - filter
    - order

    * page
    * limit

Technical Writing, Business Requirements
Message Integration Patterns, Service Oriented Architecture, Event Driven System
Model Driven Development

- Počítání v binární soustavě
- bitový posun doleva
- bitový posun doprava
- sečtení binárních čísel
- převody hexa, binární, decimální soustava

- Lexer + Pareser
- Context Free Grammar
- PEG

Pro oblast zájmu vytvoř slovník pojmů (glosář) tj. definuj termíny, pomocí termínů vyslov fakta a
pomocí faktů pravidla (terms -> facts -> rules)

## System modeling

- Simulation
  - Discrete Time Simulation + Discrete Event System Specification
  - Discrete Event Simulation
- Finite State Machine + Markov Chain

- Probabilistic models := outputs the distribution of possible outcomes
  - Graphical models‎

- Deterministic models

--

## Programming

### Algorithms and Data Structures

- Array
  - Selecting
    - Quick Select
  - Searching
    - Binary Search
  - Sorting
    - Bubble Sort
    - Merge Sort
    - Radix Sort

- Tree & Graph

- Representation
  - Edge List
  - Adjacency Matrix; matice sousednosti
  - Adjacency Lists
  - Incidence Matrix; matice incidence

- Searching
  - Breadth First Search (BFS); prohledávání do šířky
  - Depth First Search (DFS); prohledávání do hloubky

# Předmet pro zápis 2019

Genetické metody v zoologii - MB170P59 zimní 6
Ekofyziologie živočichů a člověka - MB150P81 l 3
Zoologie obratlovců - MB170P13A 6 l
Moderní statistické metody I - MB170P108
Moderní statistické metody II - MB170P109 3
Ekologie a genetika chování - MB170P35 z 3
Evoluční genetika - MB170P102 z
Molekulární fylogenetika a taxonomie - MB160P21 z 3
Genetika - MB140P17 z 5
Vývoj člověka - MG422P56 3 z
Etologické metody I - MB170P60A 2 Z
Etologie a sociobiologie - MB170P107 5 Z
Sociobiologie primátů a člověka - MB170P93 3 l
Sociobiologie a behaviorální ekologie II
Molekulární ekologie - MB170P111 5 l

## Matematické modelování geodynamických procesů

### Modelování exogenních procesů

- <https://github.com/badlands-model/pyBadlands>
- <https://github.com/badlands-model/pyBadlands_serial>

### Modelování endogenních procesů

...

## Machine Learning

### Semantic Image Synthesis

- <https://github.com/NVlabs/SPADE>

## Animal behaviour

Děěp convolution network anad rats communications

- <https://www.youtube.com/watch?v=25LYVxTUZhM>

<https://www.youtube.com/watch?v=ADOjT_w0m2I>
<https://www.youtube.com/watch?v=xKjaWYAb1G0>

Vydejte se s námi na výlet do třetihor! Miocén byl klimaticky teplým obdobím s řadou výrazných paleogeografických a paleoenvironmentálních změn.

Před námi je poslední letošní seminář, tentokrát zaměřený na vývoj Centrální Paratethydy, tedy oceánské domény, která vznikla na konci jury a jejíž relikty dnes představuje třeba Kaspické moře nebo Aralské jezero.

Zánik dinosaurů a globální změny na konci křídy jsou jedním z velkých témat světové geologie: co bylo jejich příčinou?

Spread operator aka Python unpacking

<https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Operators/Spread_operator>

Unicredit Bank
<https://github.com/unicredit>

numpy is slower than standard library on small arrays!
<https://github.com/numpy/numpy/issues/8532>

# My personal notes on everything

*Learn How Everything Works!*

Contributions welcome!

## Recipes in various programming languages for a quick reference

## Overview

**Neworking**
- Query the REST API
- Download a file to a specified directory
- Check if an REST resource exists
- Extract the URL origin (scheme/host/port)

## Networking

### Query the REST API

### Download a file to a specified directory

### Check if an REST resource exists

### Extract the URL origin (scheme/host/port)

# Glossary

- *recursion*

- *tail recursion*
  An optimization technique that allows recursive functions of arbitrary depth without consuming stack space).

- *stack*

- *heap*

# APSG

Add **hash** method to Tensor class.
Tensor class is immutable class with structural equality,-- this is a true value object,
so we should override **hash** method  so the hash is calculated from the tensor values.

Don't inherit from ndarray.

Use properties not private values.
e.g tensor...

## Programování

Před každým projektem si ujasni k čemu má sloužit

- Napiš krátký seznam jeho vlastností
- Založ soubor s požadavky a domenovými znalostmi
- Vztvoř slovník a kontextovou mapu.

Každý program rozděl na samotné jádro (knihovna) a rozhraní např. konzolové, grafické atd. a testy.
Program si tedy např. rozděl takto:

    core.cpp
    test.cpp
    main.cpp

<https://github.com/huxingyi/dust3d/tree/master/src>

Kdy použít anaonymní jmenný prostor (anonymous namespace)?

- <https://en.cppreference.com/w/cpp/language/namespace>

Game Engine/Design
---
<https://www.redblobgames.com/grids/hexagons/>
<http://www.gameprogrammingpatterns.com/>

# Aktivace C++ kompilátoru na Windows

<https://docs.microsoft.com/en-us/cpp/build/building-on-the-command-line?view=vs-2015#developer-command-files-and-locations>

2015

"C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\amd64\vcvars64.bat"

2017
"C:\Program Files (x86)\Microsoft Visual Studio\2015\Community\VC\Auxiliary\Build\vcvars64.bat"

Cmake, C++ Blogs
<http://www.brianlheim.com> | <https://github.com/brianlheim>
<http://klmr.me/about/>     | <https://github.com/klmr>
<https://preshing.com/>     | <https://github.com/preshing>
<https://preshing.com/20170511/how-to-build-a-cmake-based-project/>
<http://kaba.hilvi.org/pastel-1.3.0/techniques_specialization.htm>

<https://oopscenities.net/2011/04/30/c-inheritance-on-template-specialization/>

------------------------------------------------------------------------------------------

# CMake

------------------------------------------------------------------------------------------

Záznam přednášek o nástroji CMake

<https://www.youtube.com/watch?v=eC9-iRN2b04>
<https://www.youtube.com/watch?v=bsXLMQ6WgIk&feature=youtu.be&t=37m15s>

Knihy o CMake
<https://crascit.com/professional-cmake/>

Články o CMake
<https://crascit.com/2017/04/18/generated-sources-in-cmake-builds/>

file(
    WRITE main.cpp
        "#include <iostream>\n"
        "int main() { std::cout << \"Hello World!\" << std::endl; return 0; }"
)

---

CLAng
---
<https://marketplace.visualstudio.com/items?itemName=LLVMExtensions.llvm-toolchain>

------------------------------------------------------------------------------------------

# C++

------------------------------------------------------------------------------------------
<https://chromium.googlesource.com/chromium/src/+/HEAD/styleguide/c++/c++-dos-and-donts.md>
<https://cppdepend.com/>
Nástorj pro staticku analýzu kódu a občas dobré články a studie projektů.
<https://www.fluentcpp.com/>
Blog o C++ -- něco se dozvíš ale není to zaručený zdroj.

<https://vector-of-bool.github.io/2018/09/16/layout-survey.html>

Curiously recurring template pattern
PIMPL
Rule of 3/5

Why use struct with operator instead of function

Project Managment

Use clang-tidy
Use appveyor.yml, circle.ci, travis

Proč používat nullptr?

Jak použít delegating constructors?

Co je to enum class?

K čemu je *range based loop*?
<https://en.cppreference.com/w/cpp/language/range-for>

struct vs class

reference type &

const method

nothrow method

How to make your class non derivable = final
final class (C++11)

raw pointer

unique pounter, shared pointer

lvalue, rvalue, move semantics

rule of five

explicit constructor, virtual destructor

type traits + concepts (C++ 20)

async + threads

template function, template parameter

template class

const + constexpr

TBB (Threading Building Blocks)
Boost
Qt
GoogleTest, GoogleMock, Catch, Doctest

# Fortran

coarray

-------------------------------------------------------------------------------

# Python

-------------------------------------------------------------------------------

- Jak a proč požívat datové třídy
  <https://docs.python.org/3/library/dataclasses.html>

- Async/Await

Numba
Cython
C++/C/Fortran Extensions

How to install packages not on PyPi.

How to write `setup.py` to use a git repository as a dependency

    dependency_links=['http://github.com/<user>/<repository>/tarball/master#egg=<package_name>-<package_version>']
    dependency_links=['http://github.com/<uetoyo>/result/tarball/master#egg=result-1.3.1']

Nepoužívej v metodách privátní členy třídy, pokud existuje metoda nebo property, kterou můžeš získat požadovanou hodnotu atributu.

např.

    class Rectangle:

        def __init__(self, width, height):
            self._size = (width, height)

        @property
        def width(self):
            return self._size[0]

        @property
        def height(self):
            return self._size[1]

        @property
        def area(self):

            # ANO
            return self.width * height

            # NE
            return self.size[0] * size[1]

# Computer Graphics Notes

## Graphic Primitive Object

- What is mesh?
-

# Graphics file formats

## 3D Model File Formats

### OBJ + MTL

- extension .obj
- Wavefront Technologies
- <https://en.wikipedia.org/wiki/Wavefront_.obj_file>

MTL (Material template library)

### PLY

Polygon File Format

## Image Graphics File Formats

<https://en.wikipedia.org/wiki/Image_file_formats>

### Raster Graphics File Formats

- Exif

- JPEG (Joint Photographic Experts Group) <https://en.wikipedia.org/wiki/JPEG>

- TIFF (Tagged Image File Format) <https://en.wikipedia.org/wiki/TIFF>

- PNG

- GIF (Graphics Interchange Format)

- BMP (Windows Bitmap)

- PPM, PGM, PBM, and PNM

### Vector Graphics File Formats

### Container formats of raster graphics editors

- PSD
- PSP

# Země

In 1961, L. Slichter pointed out that some of the Earth's seismic modes might consist of translational oscillations of the solid inner core about its equilibrium position at the centre of the Earth. This motion, the "Slichter mode", is principally controlled by the density jump between the inner and outer core, and the Archimedean force of the fluid core. Its period is thought to lie within 4-8 hours and is split into 3 components by the Earth's rotation.

# GUI/UI

Imediate vs Retained Mode
<https://docs.microsoft.com/en-us/windows/desktop/learnwin32/retained-mode-versus-immediate-mode>

Témata k zamyšlení a práci?

Navigace zvířat pomocí magnetismu a echolokace

<https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3179100/>
17. Holland RA, Thorup K, Vonhof MJ, Cochran WW, Wikelski M. Navigation: Bat orientation using Earth's magnetic field. Nature. 2006;444:702

## Evoluce Nervového Systému

Mgr. Pavel Němec, Ph.D.

## Morfologie živočichů - MB170P4

Mgr. Pavel Němec, Ph.D.

<https://is.cuni.cz/studium/predmety/index.php?do=predmet&kod=MB170P46>

řehled základních orgánových soustav mnohobuněčných živočichů z hlediska jejich vzniku, ontogenetického vývoje a evolučních souvislostí. Důraz je kladen především na obratlovce v kontextu strunatců a na klíčové momenty morfogeneze a evoluce Animalia.
Výklad se omezuje na základní obecná schémata; popis konkrétních variant přenechává navazujícím přednáškám fylogeneze a systému.

Sylabus

1: Úvod, historie, význam a rozčlenění oboru. Orientace na těle živočicha, připomínky kontextu systému, fylogeneze, evoluce, forma & funkce. Živočichové (Animalia).
2: Vývojová morfologie: důležitost ontogenetických znaků pro pochopení morfologie; embryonální původ orgánových soustav, morfologie larev. Evoluční morfologie: tělní plány, Hox geny, kambrická exploze.
3: Pokryv těla, integument, povrchy.
4: Mechanizmy pohybu I: Měňavkovitý pohyb, brvy, bičíky, kost, sval.
5: Mechanizmy pohybu II: Kostra a svaly hlavy.
6: Mechanizmy pohybu III: Axiální skelet a svalstvo, kostra a svaly končetin.
7: Integrace I.: Smyslové orgány.
8: Integrace II: Nervová soustava.
9: Integrace III: Humorální regulace, žlázy s vnitřní sekrecí.
10: Metabolismus I: Příjem potravy, trávící soustava.
11: Metabolismus II: Dýchání, dýchací orgány, oběhová soustava.
12: Osmoregulace, vylučování & reprodukce.

Zdroje

Vynikající česká klasika, žel jen na obratlovce:
Gaisler, Zima: Zoologie obratlovců. Academia, 2007.
Asi nejlepší "vertebratologie":
Liem, Bemis, Walker, Grande: Functional Anatomy of the Vertebrates, an evolutionary perspective. Kterékoliv vydání.
Také pěkná a prudce doporučitelná:
Kardong: Vertebrates. Comparative anatomy, function, evolution. Kterékoliv vydání.
Nejlepší "invertebratologie":
Ruppert, Fox, Barnes: Invertebrate zoology. Kterékoliv vydání.
Také pěkná a prudce doporučitelná:
Brusca a Brusca: Invertebrates. Kterékoliv vydání.
Obecně zajímavé a prudce doporučitelné:
Zrzavý J.: Fylogeneze živočišné říše.

Chemie

## Síran (Sulfate) SO_4^2-

Soli odvozené od H_2SO_4
Anhydrit, Sádrovec, Baryt, Kamenec

K_2SO_4; Síran draselný, Potassium sulfate; Draselná sůl H_2SO_4

## Siřičitan (Sulfite) SO_3^2-

## How to write recipes

You can write everything in the form of requirements e.g

    "As u user I want to be able to export Python notebook to PDF",

This can be easily translated to the form of recipe e.g

    "How to export Python notebook to PDF".

or to to the form of command (imperative)

    "Export Python notebook to PDF"

- Find broken links in text.

- Find grammar mistakes in text.
  - misspelled words
  - missing punctuation
  - missing a/an/the
  ...

User Story se orientuje na výsledek a důvody.
Use Case přesně popisuje kroky, jak výsledku dosáhnout.
User Story tedy může vést na různé Use Cases.

For clients (users of the product) it

Scenario: Person registration.

As the [user] on the [page]
When the the [add-new-button]
Then [person_form] is visible.

Formáty:

"As a <persona>, I want <what?>"
"As a <persona>, I want <what?> so that <why?>"
"As a <persona>, I can <action with system> so that <external benefit>"

Project:
    Data Analyzer

Personas:
    Analyst

User Stories:

As a <analyst> I want to see all existing analyses.
As a <analyst> I want to see existing

As <anonymous_user> when I visit <index_page> then <loggin_form> is visible.

Non-Functional User Stories
Ty které přímo nesouvisí s konkrétní funkcí systému, ale s nějakou jeho obecnou vlastností např.
As a user, I want to be able to run application in all mahor web browsers.

COMPANY
SERVICE/EXPLORE
CONTACT

UI/UX
QA/CD

MS710P05    Matematická statistika
Fyziologie

Morfometrie
<http://www.indiana.edu/~g562/>
<https://link.springer.com/article/10.1007/s11692-009-9055-x>

Začni tvorbou doménového modelu.

Nejdříve identifikuj tzv. bounded-context, v našem případě. registrování osob, tj. Máme

BOUNDED-CONTEXT musí obsahovat alespoň 1 AGRREGATE.
AGGREGATE musí obsahovat právě jeden AGGREGATE-ROOT.
AGGREGATE_ROOT musí být typu ENTITY.

Algoritmy

Bresenhams Line Algorithm

INSPIRACE

<https://github.com/glampert/vectormath/>
DATA ORIENTED DESIGN

<https://www.fluentcpp.com/2018/12/21/an-soa-vector-with-an-stl-container-interface-in-cpp/>
<https://shot511.github.io/>
<https://github.com/uetoyo/pulse/blob/master/cplus_prototype/old/vector.hpp>
<https://github.com/root-project/root/tree/master/math>

Tests
----
<https://github.com/mattkretz/virtest>
<https://github.com/pfultz2/Prove/blob/master/include/prove.hpp>
<https://github.com/whunmr/msgtest/blob/master/samples/sample_tests.cpp>
<https://github.com/misoboute/ProTest/blob/master/Sample.cpp>

<https://github.com/plotfx>

<https://github.com/borasoftware/balau/blob/master/src/main/cpp/Balau/Serialization/SerializationMacros.hpp>

TODO

Zlepšit wokflow pro psaní dokumentů.
Jak aplikovat kontrolu pravopisu na textové dokumenty?
Jak zobrazit nějakou lingvistickou analýzu, např. frekvence slov atd.

Jak spravovat proposal?
Dej jim stav:

- proposed
- accepted
- rejected
- finished

Algoritmy:
Pixel Perfect

<https://medium.com/@plotnick/beyond-the-hammer-and-whisk-broom-the-technology-of-paleontology-c81088e2164d>

Jak správně navrhnout a dokumentovat REST API?

<https://github.com/Microsoft/api-guidelines/blob/vNext/Guidelines.md#51-errors>

Co je to REST bez PUT? <https://www.thoughtworks.com/insights/blog/rest-api-design-resource-modeling>

<http://michal.karzynski.pl/>

Jak vytvářet task y na pozadí?
Lze použít

Jara podobná meagic carpet, kde si tkáš valstní koberec s geometrickým vzorem.

Alexander_Grothendieck

Součástí zápočtu bude práce o maximálním počtu 12000 znaků, což bz mělo studenta vést k tomu aby se vzjádřil na
tomto prostoru, naroydíl od jiných tzpl prací, ketré podporují a vznucují natahování prce na minimální počet znaků.

Hodnocení a zkouška jako taková  bude v rámci možnosttí individuální.
Každému vyhovuje jiná forma royhovoru, někomu písemná forma někomu śtní a někomu kombinovaná.

Součástí metodiky hodnocení je předevší objevit studentovi silné stránky nikoliv najít jen jeho slabiny.
Pokud ale student salbinz má, má právo  o nich vědět abz na nich mohl pracovat, bez negatovního dopadu na jeho hodnocení.

Dnes jednoduchá věc -- binární klasifikátor v Pythonu

[] Protokoly Hydrogeologie
[] Protokoly Geofyzika
[] Protokoly Mineralogie
[] Protokoly Geochemie

Jak ignorovat nějaký soubor nebo adresář jen v mém projektu?
Např. chsi sám používat pyproject.toml, ale nechci ho přidávat do vzdáleného repozitáře.

PŘEHLED

4-11-2018
---

Započatá práce na tinyrenderer
Implementován Vektor a částečně Matrix, funkce draw_line a draw_triangle.
Program již umí vykreslovat do TGA.

5-11-2018
---

Práce na tinyrenderer.

6-11-2018
---

Implementace jedoduchéheo frame buferru.

29-11-2018
---

Práce na aplikaci Cro-DataAnalyzer s Adamem Mertelem, úprava REST API serveru (zjednodušení).

30-11-2018
---

Migrace z Pythonu do C#/F#?

Jak vést projekt?
Jak psát čistě tak, abychom se nebáli program rozšiřovat?

Simple compile time tests in C++

---
Popsat chování frontendu jako stavový automat.

Vytvoř novou analýzu
Vutvoř nový filtr

Motivace pro projekty
---------------------

DataSpect

WorkFlows

3D Modelování vyhynulých druhů.
Jak z kostry rekonstruovat měkké tkáně jako svaly a kůži?

Publikovat krátké animace a naučná videa na internetu -- musíme mít ale možnost oprav neboť věda reviduje poznatky.
Srovněj s malbami Zdeňka Buriana, které nejsou již aktuální z vědeckého hůediska, přestpže zůstavají výbornými obrazy.

V C++ můžeme buď použít dědičnost nebo specializaci.
Jaký je v tom rozdíl?

Python/Numpy Scipy

Násobení matic
Sčítání matic
Násobení matice skalárem

Problémy fosilního záznamu.
nekompletní nález
nálezy přísluší různým fázím vývoje -- mladý vs starý jedinec.
deformace/distorze nálezu -- např. deformace lebky vedla k přiřazení stejného druhy dvoum taxonům Schultz
and Falkenbach (1956, 1968) Eocene-Oligocene oreodont Miniochoerus

c++ blogy
<https://www.fluentcpp.com>

Python blogy

Math blogy

<http://www.euclideanspace.com/maths/algebra/realNormedAlgebra/quaternions/transforms/derivations/vectors/index.htm>

Zajímavé Python moduly.

<https://github.com/Delgan/loguru>

<https://github.com/alicevision/meshroom>

Biologie

Parafyletický
Monofyletický

Taxon

Kladistika

Počítačová Tomografie CT Scan

Evoluční biologie
Teorie přerušovaných rovnováh

Fitness Landscape

Paleobilogické databáze
<http://fossilworks.org>

-- | Vrací barvu s normalizovanými složkami, tz,. že pokud složka barvy přesahuje
-- | rozsah 0 až 1.0, je automaticky převedena na maximální hodnotu 1.0.
