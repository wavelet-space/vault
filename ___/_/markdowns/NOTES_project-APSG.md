# APSG NOTES


- Architecture & Design
- Design Decisions
- Versioning & Releasing
- Continuous Integration
- Feature Request
- Bug Report & Fix
- Unit & Integration Testing, Benchmarks
- Code Style, Automatic Formatters
-
- Resources (Blogs, Books, Papers)
- Examples, Tutorials


https://en.wikipedia.org/wiki/Deformation_(mechanics)#Stretch_ratio

Stretch or Extension Ratio

    $\lambda$ = L_{final}/L_{initial}

Cauchy or Engineering Strain (Elongation)

    e = ( L_{final} - L_{initial} ) / L_{initial}

      = \lambda - 1

Strain
Normal Strain is parallel to the face
Shear Strain is perpendicullar to the face of an element

Isotropic Material
Hook's Law

- TODO

## Architecture & Design

## Unit and Integration Testing

Pro spouštění dokumentačních testů můžeme využít kromě standardního postupu [LINK] také integraci s pytestem https://docs.pytest.org/en/latest/doctest.html

## Versioning & Releasing

## Continuous Integration

## Resources -- Books, Papers, Articles

Jake VanderPlas. Python Data Science Handbook. https://jakevdp.github.io/PythonDataScienceHandbook

## TODO

- Add `.github` folder with templates.
- Set continuous integration task on Appveyor to test Windows OS.
- jupyter, binder, googlenteract,

## Features

- Tectonic marks represntation in code and charts.
- Parsing module for Strike/Dip Azimuth/Inclination.

### Design Decisions

Proč jsme vytvořili vlastní implementace vektoru, matice.
Původní implementace dědila z `numpy.array` .
Problém byl hlavně:
třídy sice přetěžovali __eq__ ale nemohli jsme přetížit __hash__, protože numby array je mutabilní třída.
Naše implementace tedy správně impelemntuje __eq__ a __hash__ a všechny metody které mění stav vrací novou instanci.
Instance mají tedy strukturální rovnost a dají se uložit do `set` i `dict` poku by bylo potřeba.
Poznmáka: Pokud potřebujete opravdu referenční rovnost použijte operátor `is` nebo funkci `id`.

    Používáme NewType pro alias
    Scalar = typing.NewType('Scalar', float)

Integrace pytests a doctestu
https://docs.pytest.org/en/latest/doctest.html

In some cases, Python-Numpy is too slow.

Doporučit
https://github.com/nteract
https://medium.com/netflix-techblog/scheduling-notebooks-348e6c14cfd6

Použít
https://numba.pydata.org/


### `Matrix`

Matrix by měl přimout jak hodnoty tak pole.

    Matrix(1, 2, 3, 4)
    Matrix([1, 2], [3, 4])
    Matrix([[1, 2], [3, 4]])

Přidána metoda `__neg__` pro změnu znaménka všech komponent matice.


### `Vector`

Přidána metoda `__bool__` a je tedy možné vektor použít v logických výrazech.

    if vector:
        print("This is a non zero vector.")

    implement def __getslice__(self, i, j):
     viz https://github.com/kivy/kivy/blob/master/kivy/vector.py


Porovnat rychlost


    def __sub__(self, val):
        return Vector(list(map(lambda x, y: x - y, self, val)))

    def __div__(self, val):
        try:
            return Vector(list(map(lambda x, y: x / y, self, val)))
        except Exception:
            return Vector([x / val for x in self])


Použít nějaký nástroj
- metriky radon, metrics
- benchmarky pytest-benchmark
- formátování black, google...

Začali jsem používat modul `typing`.
Typy zapisujem v podobě komentířů kvůli kompatibilitě z pythone 2.7


Uvědomme si, že assert zmisí pokud se python code optimalizuje! Takže tato validace není korektní.

---
Remove `requirements.txt`.
Package can be fully installed via setup.py
Remove the pip install -r requirements from travis config

---todo

- Add more info about installation for developers to README.
- Run doctest on travis



Vec([1, 2, 3])
Povolit sečtení skaláru a vector?

Odstranit modul shell, ale zchovat interaktivní spouštění, dát do adresáře bin a nastavit skript v setup.py.
Přejměnovat db na database a trochu učesat -- např, reposiotry pattern.
Vytvoři subpackage math a přemístit tam vector, tensor, matrix.

Zavést src/ adresář argumenty viz https://github.com/pypa/packaging.python.org/issues/320
https://blog.ionelmc.ro/2014/05/25/python-packaging/#the-structure


Tento balík slouží také pro výuku, proto jsou samozřejmě všechny veřejné třídy, jejich metody a funkce zdokumentovány.
Navíj jsou však dobře zdokumentovány i neveřejné, tj interní třídy atd. K tomu všemu jsou popsáno proč je to implementováno v současné podobě a jaké jiné možnosti jsme prozkoumali. K balíku patří také tutoriál v podobě knihy, která se dá použít ke studiu strukturní geologie i v případě, že nemáte touhu programovat.


### Structural Geology Language

Folding_Matrix
Buckling
Bending
Folding

## Installation


## Implementation

Poznámky, tipy a triky.

### Ho w to deal with `None`

In Python you can pass None value to every function parameter.
This can be a problem because you have to be prepared for that scenario and you should handle this or raise an exception.

https://docs.quantifiedcode.com/python-anti-patterns/readability/comparison_to_none.html

RIGHT with pattern `if condition is None`

    if number is None:
        # Handle, raise exception etc.



WRONG

    if number == None:
        ...



### Volání `self.__class__(...)`

Použití `self.__class__()` namísto incializace voláním názvu třídy např `Vector(1, 2, 3)`
Používáme to především v metodách, které vrací novou instanci a kterou chceme zachovat v podtřídách.
Pokud bychom volali přímo název třídy, pak bychom museli vše v podtřídě reimplemennotavt, takto se zavolá správná aktuální třída.


````python
class Vector:
    def __init__(self, *components):
        self.components = *components

    def __len__(self) -> int:
        return len(self.components)

    @classmethod
    def uniform(component):
        return self.__class__(len(self) *component)
        #           ^^^^^^^^^ Here the current class is called.


class Vector2(Vector):
    def __init__(self, *components):
        super(
).__init__(*components)

class Vector3(Vector):
    def __init__(self, *components):
        super().__init__(*components)


vector = Vector2.uniform(0)
vector = Vector3.uniform(0)

```

### Strukturální rovnost a metody `__eq__`, `__ne__` a `__hash__`

Většina objektů se kterými pracujeme má tzv. strukturální rovnost, tj. že dva objekty se neporovnávají referenčně tj. pomocí adresy objektů ale pomocí jeho hodnot.
Takovýmto objektům se někdy říka  hodnotový objekt `value object` viz DDD . V objektově orientovaných jazycích je výchozí porovnání většinou referenční, a proto musíme
přetížit operátor rovnosti `==` a případně i `!=` (v Pythonu 3 je implementován automaticky jako negace op. rovnosti).

Přetížíme metodu `__eq__()` případně i `__ne__()`


```python
def __eq__(self, other: Vector2) -> bool:
    return self.x == other.x and self.y == other.y
```

V jazyce Python verze 3 je metoda `__ne__` přetížena automaticky, ale pokud podporujeme i verzi 2, musíme ji implementovat explicitně jednoduše jako negaci `__eq__`.

```python
def __ne__(self, other):
    return not (self == other)

```

Nebo ještě úsporněji, bude nám ovšem chybět dokumantace k této mětodě, proto je předchozí příklad preferován.

```python
 __ne__ == not __eq__
 ```


# DEVELOPMENT NOTES

## Obsah

- __Proč používat type hints?__ *Why use type hints?*
- __Proč upřednostňovat neměnné typy?__ *Why to prefer immutable types?*
- __Proč je dědění od `ndarray` téměř vždy špatný nápad?__ *Why subclassing `ndarray` is almost always a bad idea?*
- __Proč nepoužívat Python 2.7?__
- __Proč nepoužívat Python 3.4?__

node based plugin system
__depends__
__outputs__

## Odkazy

## Automatizuj nastavení githu repozitáře

- Nastavení větví a pull requestů.

- Použití DEBUG -- https://stackoverflow.com/questions/13352677/python-equivalent-for-ifdef-debug


## DDD a REST

https://stackoverflow.com/questions/46994302/the-role-of-aggregate-roots-in-a-rest-api-ddd
https://www.youtube.com/watch?v=aQVSzMV8DWc

- https://www.pythoncentral.io/

## Jak vložit interaktivní konzoli

https://www.pythoncentral.io/embed-interactive-python-interpreter-console/

## Metaclass -- základy

https://realpython.com/python-metaclasses/

## Piš komentáře ve větách.

Pěkný příklad https://github.com/python/mypy/blob/master/mypy/checkexpr.py

## Vložení `__slots__` pomocí metatřídy

    class MetaSlot(type):
        def __new__(mcs, name, bases, dic):
            dic['__slots__'] += ('y',)
            return type.__new__(mcs, name, bases, dic)


    class C(metaclass=MetaSlot):  # Python 3 syntax
        __slots__ = ('x',)

+ https://stackoverflow.com/questions/20086908/is-it-possible-to-add-slots-in-decorator-of-class-that-already-defines-slo
+ https://stackoverflow.com/questions/48568278/why-differences-in-class-slots-assignment-via-decorator-vs-class-body

## Proč používat type hints?

- https://github.com/python/typing/graphs/contributors
- https://github.com/python/typeshed

## Proč upřednostňovat neměnné typy?

## Proč je dědění od `ndarray` povětšinou špatný nápad?

## Proč dokumentovat?

> “Code is more often read than written.”
> — Guido Van Rossum

> “It doesn’t matter how good your software is, because if the documentation is not good enough, people will not use it.“
> — Daniele Procida

> “Code tells you how; Comments tell you why.”
> — Jeff Atwood (aka Coding Horror)

## Matclass v Pythonu 2 vs 3

    # 3
    class ExampleClass(metaclass=type):
        pass

    # 2
    class ExampleClass(object):
        __metaclass__ = type
        pass

## TIPY A TRIKY

## Proč metoda musí přebírat `self` či `cls`?

## Kdy použít `__new__`

## Kdy použít `__call__`

## Kdy použít `@classmethod` vs `@staticmethod`

## Jak definovat vlastní metaclass?

https://realpython.com/python-metaclasses/

## `type` vs `object`

    class A(type):
        ...

    class B(object):
        ...

    type(A)
    type(A())

## Před početím kódu je možné si napsat pomcí komentářu kroky.

    def my_function():
        # The 1st step
        # The 2nd step
        # The 3th step

Vědeli jste že lze zapsat i `...` na samostatný řádek, což interpretr ignoruje? Namísto teček posléze doplňte svoji implementaci.

    def my_function():
        # The 1st step
        ...
        # The 2nd step
        ...
        # The 3th step
        ...

## Používej modul `venv`

## Spouštěj Python

## Používej *type hints*, kde to jde.

Je to dokonce snažší než psát typu do komentáře.
(Python 3.5+)

    def hello_name(name: str) -> str:
        return(f"Hello {name}")

## Používej *f string*


## Používej funkci `help()`

    >>> help(str)

Piš dokumentaci modulu, třídy, metody a funkce tak, aby se dobře zobrazila.
Stačí si pamatovat jen funci `help()` např. `help(dir)`


## Používej funkci `dir()`

    >>> dir(str)

## Použití `self.__class__` a `self.__class__.__name__`


- One big advantage of making them immutable is that they can be used
    as keys in a dictionary. I'm sure the internal data structures used by dictionaries would get quite messed up if the keys were allowed to change.

- https://softwareengineering.stackexchange.com/questions/151733/if-immutable-objects-are-good-why-do-people-keep-creating-mutable-objects


Because it is much easier to reason about code. Imaginet that you have a function that takes a list as paameter.

    def accidently_mutate(objects):
        return

https://stackoverflow.com/questions/1538663/why-are-python-strings-and-tuples-are-made-immutable



Python - Should I alias imports with underscores?
https://stackoverflow.com/questions/26080480/python-should-i-alias-imports-with-underscores

How toname modules
You have to use underscores to separate module name words as other characters (spaces or hyphens) will prevent importing (- is the subtract operator).

    # OK
    import library.plugin.foo
    # not OK
    import library.foo_plugin


How to name scripts
Use hyphens like run-script, which prevent it form improting an clearly say "I'm script!"

What means undersocer in names?
`_attribute, __attribute, _ClassName`
Subclassing ndarray is almost always a bad idea...
http://numpy-discussion.10968.n7.nabble.com/Trouble-subclassing-ndarray-tp40176p40177.html


Popravdě, OOP je už za zenitem. většina nových jazyků dědičnost nemá (Rust, Go) a naísto toho má jíný mechanismus
jak chování přidat k čisté struktuře.

    struct Point {
        x : int
        y: int
    }

    fn distance(Point) {

    }

Koncekonců i OOP učebnice stáe zdůraznují -- upřednostňuj kompizici před dědičností.
Správně pojaté OOP mělo jen pár jazyků jako Smalltalk, Eiffel.

Článek trochu "řvoucí", ale vpodstatě pravdivý https://codeburst.io/inheritance-is-evil-stop-using-it-6c4f1caf5117
Using inheritance is not the only way to extend a class behavior. But definitely is the most dangerous and harmful one.



# ##############################################################################
Starý kod

# -*- coding: utf-8 -*-


"""
Linear algebra vector types.


DESIGN NOTES

- Use `__slots__` because it can speed up the implementation.

- Vector components can be passed as separate values e.g Vector3(1, 2, 3).
  Previously it was necessary to pass a sequence e.g Vec3([1, 2, 3]), which is -- in my opinion -- unintuitive.

- Remove inheritance from `numpy.ndarray`. Not only it doesn't speed up the implementation but it
  can't be hashed, we override most methods and lot of methods are newer used nor tested -- for example T as transpose
  `Numpy.array` is great, but for big matrices and vectors!

- Don't cast type to subclass (Lin/Fol) in parent Vector class -- it was confusing:
   def __new__(cls, arr, inc=None, mag=1.0):
        if inc is None:
            obj = np.asarray(arr).view(cls)
        else:
            obj = mag * Lin(arr, inc).view(cls) #<<< THIS IS REALLY CONFUSING!
        return obj


Move settings from `core` to `setting` module.
Move vectors from `core` to `vectors` module.

"""


from abc import ABC
import operator as op

import numpy as np

from apsg.setting import settings

from apsg.math.helpers import (
    KentDistribution,
    sind,
    cosd,
    acosd,
    asind,
    atand,
    atan2d,
    angle_metric,
    l2v,
    getldd,
    _linear_inverse_kamb,
    _square_inverse_kamb,
    _schmidt_count,
    _kamb_count,
    _exponential_kamb,
)


__all__ = ("Vector2", "Vector3")


class Vector(ABC):
    """
    Vector abstract base class.
    """

    __slots__ = ("_components")  # Don't forget this in subclass!

    def __init__(self, *components):
        # Převést na float
        self._components = components # tuple

    # FIXME Remove this, it's confusing.
    def __call__(self): # type () -> tuple[float]
        """
        Return the vector components.
        """
        return self._components

    def __array__(self, dtype=None):
        return np.array([*self()], dtype=dtype) if dtype \
            else  np.array([*self()])

    def __eq__(self, other): # type: (Vector) -> bool
        """
        Return `True` when the vector components are equal otherwise `False`.
        """
        return isinstance(other, self.__class__) and self() == other()

    def __ne__(self, other): # type: (Vector) -> bool
        """
        Return `True` when the vector components are not equal otherwise `False`.

        This have to be implemented for Python 2 compatibility.
        """
        return not (self() == other())

    def __hash__(self): # type: () -> int
        return hash((self.__class__.__name__, self()))

    def __repr__(self): # type: () -> str

        if settings["vec2dd"]:
            result = "V:" + "/".join(["{:.0f}".format(c) for c in self.dd ]) + ")"
        else:
            result = "V(" + ", ".join(["{:.3f}".format(c) for c in self() ]) + ")"
                # Maybe we should use `self.__class__.__name__` instead of `V`

        return result

    __str__ = __repr__

    def __abs__(self): # type: ()
        """
        Return the 2-norm or Euclidean norm of vector.
        """
        return np.linalg.norm(self)

    def __neg__(self):
        return self.__class__(*map(op.neg, self))

    def __len__(self): # -> int
        # None -> int
        return len(self())

    def __getitem__(self, index):
        """
        Return a component with the given index.
        """
        return self()[index]

    def __add__(self, other):
        # if len(self) != len(other)
        return self.__class__((i + j for i, j in zip(self, other)))

    # __radd__()

    def __sub__(self, other):
        return self + (-other)

    def __mul__(self, other):
        """
        Return the scalar product of two vectors.

        Co s násobením zleva vs zprava
        """
        return np.dot(self, other)

    def __div__(self, other): # other: scalar
        return self.__class__(*map(op.div, self))

    # def _unit_nth(cls):
    #     # create unit vector with 1 value on specified indes, other coordinates are set to 0.
    #     return self.__class__([1 for _ in range(0, len(self)) if i == nth else 0])

    @property
    def uv(self): # TODO Rename to `normalize`
        """
        Normalize the vector to unit length.

        Returns:
          The unit vector of ``self``.

        Example:
          >>> u = Vector(1, 1, 1)
          >>> u.uv
          V(0.577, 0.577, 0.577)

        """
        return self() / abs(self)

    @classmethod
    def rand(cls):
        """
        Random unit vector from distribution on sphere
        """
        return cls(np.random.randn(3)).uv

    def dot(self, other):
        return self * other

    def angle(self, other):
        """
        Calculate the angle between two vectors in degrees.

        Spočte úhel vůči vectoru nebo skupině vektorů.

        Args:
            other: other ``Vec3`` vector

        Returns:
            The angle between `self` and `other` in degrees.

        Example:
            >>> v = Vec3([1, 0, 0])
            >>> u = Vec3([0, 0, 1])
            >>> v.angle(u)
            90.0
        """

        if isinstance(other, Group):
            return other.angle(self)
        else:
            return acosd(np.clip(np.dot(self.uv, other.uv), -1, 1))

    def rotate(self, axis, angle):
        """
        Return rotated vector about axis.

        Args:
            axis (``Vec3``): axis of rotation
            angle (float): angle of rotation in degrees

        Returns:
            vector represenatation of `self` rotated `angle` degrees about
            vector `axis`. Rotation is clockwise along axis direction.

        Example:
            # Rotate `e1` vector around `z` axis.
            >>> u = Vec3([1, 0, 0])
            >>> z = Vec3([0, 0, 1])
            >>> u.rotate(z, 90)
            V(0.000, 1.000, 0.000)

        """

        e = Vec3(self)  # rotate all types as vectors
        k = axis.uv
        r = cosd(angle) * e + sind(angle) * k.cross(e) + (1 - cosd(angle)) * k * (k * e)

        return r.view(type(self))

    def proj(self, other):
        """
        Return projection of vector `u` onto vector `v`.

        Args:
            other (``Vec3``): other vector

        Returns:
            vector representation of `self` projected onto 'other'

        Example:
            >> u.proj(v)

        Note:
            To project on plane use: `u - u.proj(v)`, where `v` is plane normal.

        """

        r = np.dot(self, other) * other / np.linalg.norm(other)

        return r.view(type(self))

    # ???
    def transform(self, F, **kwargs):
        """
        Return affine transformation of vector `u` by matrix `F`.

        Args:
            F (``DefGrad`` or ``numpy.array``): transformation matrix

        Keyword Args:
            norm: normalize transformed vectors. [True or False] Default False

        Returns:
            vector representation of affine transformation (dot product)
            of `self` by `F`

        Example:
            # Reflexion of `y` axis.
            >>> F = [[1, 0, 0], [0, -1, 0], [0, 0, 1]]
            >>> u = Vec3([1, 1, 1])
            >>> u.transform(F)
            V(1.000, -1.000, 1.000)

        """
        if kwargs.get("norm", False):
            res = np.dot(F, self).view(type(self)).uv
        else:
            res = np.dot(F, self).view(type(self))
        return res


class ZeroVector(Vector):
    __slots__ = ("_components",)


# #############################################################################
# Public
# #############################################################################

class Vector2(Vector):
    """
    Represents a 2-dimensional column arithmetic vector.
    """

    __slots__ = ("_components") # An attribute from superclass!


    def __init__(self, *components):
        super(self.__class__, self).__init__(*components)

    # Named constructors.

    @classmethod
    def unit_x(cls):
        return UnitXVector2()

    @classmethod
    def unit_y(cls):
        return UnitYVector2()

    @classmethod
    def e1(cls):
        """
        An alias for ``Vector2.unit_x()``.
        """
        return cls.unit_x()

    @classmethod
    def e2(cls):
        """
        An alias for ``Vector2.unit_y()``.
        """
        return cls.unit_x()

    @property
    def basis(self): # () -> tuple[UnitXVector2, UnitYVector2]
        return self.__class__.e1(), self.__class__.e2()

    def with_x(self, x):
        """
        Returns a new vector with changed `x` coordinate.

        Args:
            x (float) - A new `x` component.

        Example:
            u = Vector2(1.0, 0.0)
            v = u.with_x(2.0)
            'V(2.0, 0.0)'

        """
        return self.__class__(x, self.y)

    def with_y(self, y):
        """
        Returns a new vector with changed `y` coordinate.

        Args:
            x (float) - A new `y` component.

        Example:
            u = Vector2(0.0, 1.0)
            v = u.with_y(2.0)
            'V(0.0, 2.0)'

        """
        return self.__class__(self.x, y)

# #############################################################################
# Private
# #############################################################################

class ZeroVector2(Vector2):
    """
    Represents a 2-dimensional zero vector `(0.0, 0.0)`.
    """

    def __init__(self):
        """
        Don't use directly, instead use the ``Vector2.zero()`` factory method.
        The zero vector is also created when you initialize the ``Vector2`` instance with zero values.
        """
        super(self.__class__, self).__init__(0.0, 0.0)


class UnitXVector2(Vector2):
    def __init__(self):
        super(self.__class__, self).__init__(1.0, 0.0)


class UnitYVector2(Vector2):
    def __init__(self):
        super(self.__class__, self).__init__(0.0, 1.0)

# #############################################################################
# Public
# #############################################################################

class Vector3(Vector):
    """
    Represents a 3-dimensional vector.
    """

    __slots__ = ("_components") # An attribute from superclass!

    def __init__(self, *components):
        """
        Args:
          components: List[float]
        """
        super(self.__class__, self).__init__(*components)

    # Named constructors

    @classmethod
    def unit_x(cls): # type: () -> Vector3
        """
        Create the x-axis unit vector.
        """
        return self.__class__(1, 0, 0)

    @classmethod
    def unit_y(cls): # type: () -> Vector3
        """
        Create the y-axis unit vector.
        """
        return self.__class__(0, 1, 0)

    @classmethod
    def unit_z(cls): # type: () -> Vector3
        """
        Create the y-axis unit vector.
        """
        return self.__class__(0, 0, 1)

    # Create with new value

    def with_x(self, x): # type: (float) -> Vector3
        """
        Returns a new vector with changed `x` coordinate.
        """
        return self.__class__(x, self.y, self.z)

    def with_y(self, y): # type: (float) -> Vector3
        """
        Returns a new vector with changed `y` coordinate.
        """
        return self.__class__(self.x, y, self.z)

    def with_z(self, z): # type: (float) -> Vector3
        """
        Returns a new vector with changed `z` coordinate.
        """
        return self.__class__(self.x, self.y, z)

    # Properties

    @property
    def x(self): # type: () -> float
        return self[0]

    @property
    def y(self): # type: () -> float
        return self[1]

    @property
    def z(self): # type: () -> float
        return self[2]

    @property
    def dd(self):
        """
        Return azimuth, inclination tuple.

        Example:
          >>> v = Vector(1, 0, -1)
          >>> azi, inc = v.dd
          >>> azi
          0.0
          >>> inc
          -44.99999999999999

        """
        print(atan2d(self.uv[1], self.uv[0]) % 360, asind(self.uv[2]))

        return atan2d(self.uv[1], self.uv[0]) % 360, asind(self.uv[2])

    @property
    def upper(self):
        """
        Return `True` if z-coordinate is negative, otherwise `False`.
        """
        return np.sign(self[2]) < 0

    @property
    def flip(self):
        """
        Return a new vector with inverted `z` coordinate.
        """
        return Vec3(self[0], self[1], -self[2])

    def __pow__(self, other):
        return self.cross(other)

    # Methods

    def cross(self, other):
        """
        Calculate the cross product of two vectors.

        Args:
            other: other ``Vector3`` vector

        Returns:
             The cross product of `self` and `other`.

        Example:
            >>> v = Vector3(1, 0, 0)
            >>> u = Vector3(0, 0, 1)
            >>> v.cross(u)
            V(0.000, -1.000, 0.000)


        Example:
            >>> u = Vector3(1, 0, 0)
            >>> v = Vector3(0, 1, 0)
            >>> w = u ** v
            Vector3(0.000, 0.000, 1.000)

        """
        if np.isscalar(other):
            return pow(abs(self), other)
        else:
            return self.__class__(tuple(np.cross(self, other)))

    # as_lin()

    # as_fol()

    # as_vec()

    def H(self, other):
        """
        Return ``DefGrad`` rotational matrix H which rotate vector
        `u` to vector `v`. Axis of rotation is perpendicular to both
        vectors `u` and `v`.

        Args:
            other (``Vec3``): other vector

        Returns:
            ``Defgrad`` rotational matrix

        Example:
            >>> u = Vec3(210, 50)
            >>> v = Vec3(60, 70)
            >>> u.transform(u.H(v)) == v
            True

        """
        from apsg.tensors import DefGrad

        return DefGrad.from_axis(self ** other, self.V.angle(other))

# #############################################################################
# Private
# #############################################################################

class ZeroVector3(Vector3):
    """
    Represents a 2-dimensional zero vector.
    """
    def __init__(self):
        """
        Don't use directly, instead use the ``Vector3.zero()`` factory method.
        """
        super(self.__class__, self).__init__(0.0, 0.0)


class UnitXVector3(Vector3):
    def __init__(self):
        super(self.__class__, self).__init__(1.0, 0.0, 0.0)


class UnitYVector3(Vector3):
    def __init__(self):
        super(self.__class__, self).__init__(0.0, 1.0, 0.0)


class UnitYVector3(Vector3):
    def __init__(self):
        super(self.__class__, self).__init__(0.0, 0.0, 1.0)
