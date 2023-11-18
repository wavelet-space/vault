<!DOCTYPE html>
<head>
  <meta charset="utf8">
  <link rel="stylesheet" type="text/css" href="./assets/main.css">
  <title></title>
</head>
<body>

<div id="container">

<header>HEADER</header>

<!-- CONTENT -->
<div id="main" class="left-content">

# Programming Language Design

How should the programming language of my dreams looks like?

## Design Decisions

The type system

- nominal vs structural typing
- imperative vs declarative paradigm
- object oriented vs functional style


Documentation comment SHOULD be a part of entity e.g as in the Python.

```
func sum(a: Int, b: Int):
    "Sum the given numbers"
```


>>> sum.__doc__
>>> "Sum the given numbers"


```


```
concept Person:

    "The person type."

    field v: Real

    name(x: String) -> String:
       self.v + x

```

```
entity User : Person:
```

