# Problems and Solutions

## How to publish package on NPM

<https://www.freecodecamp.org/news/how-to-make-a-beautiful-tiny-npm-package-and-publish-it-2881d4307f78/>

Vztvoření účtun NPM
login pomocí

  npm login

publikování balíčku

 we create a package under the scope of our username. It’s called a scoped package.

  {
    "name": "@uetoyo/demo",
    "version": "1.0.0"
  }

  npm publish

nebo

  npm publish --access=public

---

- Connect From Your Local Machine to a PostgreSQL Database in Docker

## On Documentation

There are two kind of software library documenation:

- soft
- hard

The hard documenation is that writen in source code e.g class (type), method (function) comment.
The soft documenation is more narrative description how to use the library and can be in the form of tutorials and tips,
how to solve a specific problem.

## General Software Development

As a developer I want to remove all .pyc files so that ...

__Problem__

    HINT: remove __pycache__ / .pyc files and/or use a unique basename for your test file modules

__Solution__
    ...

# Common Lisp

- Which Common Lisp implementations choose?
  Use Steel Bank Common Lisp SBCL

How to install SBCL

# The Python Programming Language Style Guide

## Project

### Project Structure

...

### Project Source Code

- Project source code MUST be tested.
  The *pytest* is recommended.

- Project source code MUST be checked for style.
  The *pylint* is recommended for automatic code style checking.

- Project source code MUST be uniformly formatted
  The *black* is recommended for automatic code formatting.

### Package Usage

- Using [...] as a library
- Using [...] as a command line tool.

# RECOMENDATIONS & RULES FOR PYTHON DEVELOPMENT

This is my personal guide how to develop software in Python.

Use the existing template e.g cookie-cutter for a common project structure.
Use the virtual environment for every project you start.

## Testing

Use pytest for unit all tests.
Use coverage for test covearge.
Use radon for software metrics.

pytest.ini file?

- testing Jupyter notebooks with <https://github.com/computationalmodelling/nbval>
- test coverage with pytest-cov
- testing with pytest
- run only masrked tests
- run only speciufied moudules
- run and allow print to stderr

## Windows

How to set environment variable

    set NEWVAR=SOMETHING

The most importatnt think is to know how to search

## Glossary

- namespace package

## entry points

Why use entry points specification?

    entry_points: { ... }

## `pip`

How to install package

    python -m pip install package_name==1.0.4  

How to upgrade package

    python -m pip install --upgrade package_name

## `setup.py`

- What is `setup.py`

- What is `install_requires`
  The all dependencies needed for the package to be used.

- What is `extras_require`
  The all dependencies needed for the package to be tested.

### Rules

> The `setup.py` file MUST contain the `install_requires` section.

> The `setup.py` file MUST contain the `extras_require` section.

> Each dependency MUST be written with exactly specified version e.g "numpy==1.16.3"

The `extras_require` section contains the dictionary with listed dependencies which are installed when the key of the dictionary listed e.g

    pip install -e . ".[testing]"

SHOULD use short description from __init__.py file.
SHOULD use long description from README file.
SHOULD use version from __init__.py file.

Load the license file with:

README contains the *Required* dependencies section

    see https://github.com/facebook/Ax#requirements

README contains Installing with pip

    from PyPI

    see https://github.com/facebook/Ax#installation-via-pip

    from source


    from github master branch

README contains the *Optional* dependencies section

How to install "testisng"

    pip install -e . ".[tests, quality]"

## Versioning

The change doesn't affects user.

The change affects user
    so they have to change own source code.

New feature
Bug Fix

Why and how to remove `__pycache__`

# C++ Programming Language Style Guide

Use the keywords `MUST, MUST NOT, SHOULD, SHOULD NOT`.

## Project Structure

- Project MUST have the following directory structure:

      project_name/
        include/
          project_name/
             header files {.hpp}
        src/
          source files {.cpp}
        test/

## Build System and CMake

- Project MUST be based on CMake.  

## Method Signature

- Method MUST be marked with `const` IF it doesn't modify an instance .

  ```C++
  T get_value() const //<< GOOD 
  { 
      return m_value; 
  }
  ```

- Method MUST be marked with `noexcept` IF it doesn't throw an exception .
  
  ```c++
  T get_value() noexcept //<< GOOD
  {
      return m_value;
  }
  ```

  This rule can be compbinet with previous rule as:

  ```c++
  T get_value() const noexcept { ... }

[vv

### C++ 11 TODO

- Strongly typed enumeration
- `nullptr`
- `Shared poiter`
- `Unique pointer
- `static assert`
- `variadic template`
- `range base for loops`
- `auto`
- `decltype`
- `initilizer list`
- `noexcept`
- `move`
- `lambda functions`
- `Deleted constructors and destructors`
- `override`
- `unordered containtes`
- anonymous namespace

### C++ 20

- modules

## Resources

- <https://www.modernescpp.com/>
- <https://cppdepend.com/blog/?p=319>
- <https://cliutils.gitlab.io/modern-cmake/>
- <https://cppdepend.com/blog/?p=1180>

# C Programming Language Style Guide

## Macros

What’s the use of do while(0) when we define a macro?

```c
#define error(x) do  {        \
   fprintf(stderr, "%s\n" x); \
   exit(1)                    \
} while (0)
```

# MACHINE LEARNING

- Supervised Learning
  - Clustering
    - Centroid-based Clustering
      - K-Means Clustering
      - K-Medians Clustering
    - Density-based Clustering
  - Dimensionality Reduction
    - Feature Selection
    - Feature Projections
      - Principal Component Analysis (PCA)
        linear technique
      - ...

- Unsupervised Learning
  -

- Linear Regression
- Logistic Regression
- Decision Tree
