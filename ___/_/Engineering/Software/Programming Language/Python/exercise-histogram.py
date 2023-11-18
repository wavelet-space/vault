# -*- coding: utf-8 -*-


"""
This module implements the histogram function.
"""


import math

from typing import Sequence, Dict


__all__ = "histogram",


def histogram(*items: Sequence) -> Dict:
    """
    Calculate a histogram for the input sequence.

    Examples:
        >>> histogram(1, 2, 2, 3, 3, 3, 4, 4, 4, 4)
        {1: 1, 2: 2, 3: 3, 4: 4}
    
    """
    count = 0
    histogram = {}

    for item in items:
        count += 1
        
        if item not in histogram:
            histogram[item] = 0
        
        histogram[item] += 1

    return histogram
