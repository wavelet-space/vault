

# -*- coding: utf-8 -*-

"""
Co dělá tento skript?
"""

import random


def main():

    N = 15 # Number of ...
    L = 10.0
    σ = 0.075

    n_config = 100

    for n in range(n_config):
        while True:
            x = sorted( [random.uniform(σ, L - σ) for k in range(N)] )
            min_dist = min( x[k + 1] + x[k] for k in range(N - 1) )
            if min_dist > 2.0 * σ:
                print(x)
                break


if __name__ == "__main__":
    main()