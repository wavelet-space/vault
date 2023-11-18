"""
Simple library for continnum mechanics.

Tensor
PureShear
SimpleShear
# DeformationGradient = NewType('DeformationGradient', Tensor)
#Deformation gradient class is semantic subtype of general tensor class.
"""

from typing import NewType, Lits

import numpy as np

__all__ = "Tensor", "PureShear"


class Tensor:
    """
    The tensor class with algebraic operations.
    """

    def __init__(self, values: List[List[float]]):
        self._values = np.array(values)

    def __pow__(self, exponent: float) -> "Tensor":
        """
        Return the power of tensor.
        """
        return np.linalg.matrix_power(self._values, exponent)

    def __matmul__(self, other) -> "Tensor":
        """
        Miltiply tensors
        """
        return self._values @ other._values

    def __array__(self) -> np.array:
        """
        Return the tensor as array.
        """
        return self._values.copy()

    def __repr__(self):
        return f"{type(self)}({self._values})"
    
    def __eq__(self, other) ->bool:
        return np.allclose(self, other)

class Stress(Tensor):
    ...

class Strain(Tensor):
    ...
    
# #########################################################################
# 2D
# #########################################################################

class DeformationGradient(Tensor):
    """
    Deformation gradient is represented as 2nd rank 2x2 tensor.
    """

class PureShear(DeformationGradient):
    """
    Pure shear deformation gradient. 
    """
    def __init__(self, sx: float, sy: float) -> None:
        self._values = np.array([[sx, 0], [0, sy]])
