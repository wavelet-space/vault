# NAZCA Math

Návrh knihovny pro práci s vektory a maticemi.
Které metody exportují jiné knihovny?

## Point2/3
    
    uses Vector
    
    Point - Point -> Vector
    <=>
    Point + Vector -> Point

    Point.is_inside(Polygon) -> bool



## Triangle
## Reactangle
## Circle
## Ellipse
## Polygon
## Line


## Vector

https://github.com/dotnet/corefx/blob/master/src/System.Numerics.Vectors/src/System/Numerics/Vector3.cs

### Named Constructors

    /// Create a vector with all components set to given value.
    uniform(v) -> Vector(value, value, value)

    /// Create a vector with all components set to one
    one -> Vector(1, 1, 1):
        return uniform(1)

    /// Create a vector with all components set to zero.
    zero -> Vector(0, 0, 0):
        return uniform(0)

    /// Creates a vector with x component set to one other to zero.
    unit_x() -> Vector(1, 0, 0)

    /// Creates a vector with y component set to one other to zero.
    unit_y() -> Vector(0, 1, 0)

    /// Creates a vector with z component set to one other to zero.
    unit_z() -> Vector(0, 0, 0)

    /// Creates a vector with w component set to one other to zero.
    unit_w() -> Vector(0, 0, 0, 1)

## Public Properties

    /// return normalized vector
    normalized

    length_squared|magnitude_squared() -> float:
        return scalar_product(this, this)

    length|magnitude() -> float:
        return sqrt(magnitude_squared)

    x

    y

    z

    [index]


## Public Methods

    equals
    hash

    /// Return euclidean distance between vector endpoints
    distance(other: Vector) -> float:
        this->magnitude(this - other)

    /// Return squared euclidean distance between vector endpoints
    distance_squared(other: Vector) -> float
        this->distance()**2

    /// Restrict vector between min and max.
    clamp(Vector, min, max) -> Vector

    /// Linearly interpolate between two vectors.
    lerp(other, amount) -> Vector

    /// Change this vector to be perpendicular to what it was
    /// Effectively rotates it 90 degrees in a clockwise direction
    perp:
        return constructor</code>(this.y, -this.x);

    rotate(angle):
        ...

},

## Operators

    vector + vector
    scalar * vector
    vector / scalar ==  1/scalar * vector

    unary- negate each component
    unary+ return the same vector


## Inspirace

https://github.com/mapbox/geometry.hpp
https://github.com/carlobaldassi/mvector/blob/master/mvector.hpp
https://codereview.stackexchange.com/questions/180058/a-vector-implementation
