# How to represent values 

## Introduction

At the beginning answer yourself this question: What type should we use to represent the mass of some physical object?

    int
    float 
    bool

The answer is none of them. Each type in its own domain should be represented by user-defined type. Ask yourself again: Make sense to add two masses together? Maybe yes, but what about multiplication? 

Value object should be immutable, it means that once it is created it should not change! This seems unintuitive or impractical at the first moment but the reasons are at the same time philosophical and rational.

Because value objects are compared by they structure and we use the hash  

## Programming language matters

The true is, that in some programming languagues it is easier to define value object. For exammple in the languages as Haskell, Scala or Rust the values are immutable and compared structuraly.

__Rust__
```rust
struct Point {
	x: f64,
	y: f64
}
```
__Haskell__
```haskel
data Point = {
    x :: Float
    y :: Float
} 
```
__Scala__
```scala
case class Point(x: Float, y: Point)
```

In the language as Java, you have to *override* `hasCode()` and `equals()` methods.

In the Python up to version 3.7, you would do the same or use the `namedtuple`. From the version 3.7 it is possible to use `dataclasses` module!

```python
from dataclasses import dataclass

@dataclass
class Point:
    x: float
    y: float
```

## Types of value objects

# Single value object

# Multiple value object

Many value objects have to be represented by multiple values for example Point.

class Point:
	def __init__(self, x, y):
		self.x = x
		self.y  = y
