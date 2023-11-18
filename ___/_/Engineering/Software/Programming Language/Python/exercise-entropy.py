# -*- coding: utf-8 -*-


"""
This module implements the Shannon entropy function.
"""


import math
from typing import Sequence, Dict

from histogram import histogram


__all__ = "entropy",


def entropy(*sequence: Sequence):
    """
    Calculate the Shannon entropy H for the given input sequence.

    :param histogram: A dictionary of values and frequencies.

    Examples:
        >>> from histogram import histogram
        >>> entropy(1, 2, 2, 3, 3, 3, 4, 4, 4, 4)
        1.311278124459133
    """
    hist = histogram(*sequence)
    temp = []
    for value in hist.values():
        c = value / len(hist)
        temp.append(-c * math.log(c, 2))

    return sum(temp)


print(entropy(1, 2, 2, 3, 3, 3, 4, 4, 4, 4))