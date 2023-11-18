# -*- coding: utf-8 -*-

"""
Programming etudes in Python.
"""


class Rect:
    """
    A rectangle represented by left lower and right upper corner points.
    
                       (x₁, y₁)
            .---------+
            |         | Δy = y₂ - y₁
            +---------.
    (x₁, y₁)   Δx = x₂ - x₁

    Notes: 
        This class is immutable.

        The `area` and `perimeter` could be properties because they are 
        (possibly lazy evaluated) calculated only from other properties.
    """
    def __init__(self, x1, y1, x2, y2) -> None:

        if (x1 >= x2):
            raise ValueError("x1 must be <= x2")

        if (y1 >= y2):
            raise ValueError("y1 must be <= y2")

        self._Δx = x2 - x1  # helper
        self._Δy = y2 - y1  # helper

        self._corners = (x1, y1, x2, y2)
        
    def  __repr__(self) -> str:
        return f"{type(self).__name__}({','.join([str(_) for _ in self._corners])})"

    @property
    def width(self) -> float:
        """
        Return the width of rectangle.
        """
        return self._Δx

    @property
    def height(self) -> float:
        """
        Return the height of rectangle.
        """
        return self._Δy

    @property
    def corners(self) -> tuple:
        """
        Return the left lower and right upper corner points.
        """
        return tuple([
               (self._corners[0], self._corners[1]), 
               (self._corners[2], self._corners[3])
        ])

    @property
    def left_lower_corner(self):
        return self.corners[0]

    @property
    def right_upper_corner(self):
        return self.corners[1]

    #@property?
    def area(self) -> float:
        """
        Return the area.
        """
        return self.width * self.height 
    
    #@property?
    def perimeter(self) -> float:
        """
        Return the perimeter.
        """
        return 2 * (self.width + self.height)

    def __eq__(self, other) -> bool:
        return False if (other is None or not isinstance(other, type(self))) \
             else self.corners == other.corners
    
    def __contains__(self, other) -> bool:
        sx1 = self.corners[0][0]
        sy1 = self.corners[0][1]
        ox1 = self.corners[1][0]
        oy1 = self.corners[1][1]

        return self.width + other.width > max(sx1, ox1) - min(sx1, ox1) \
            and self.height + other.height > max(sy1, oy1) - min(sy1, oy1)
    def __and__(self, other) -> 'Rect':
        ... 


if __name__ == "__main__":
    # The `assert` cannot be used in prodcution code!

    A = Rect(x1=1, y1=3, x2=2, y2=5)
    B = Rect(x1=1, y1=3, x2=2, y2=5)    
    
    assert repr(A) == "Rect(1,3,2,5)"
    assert (A == B)

    assert A.area() == 2
    assert A.perimeter() == 6

    print(A.corners)

    print(A in B)