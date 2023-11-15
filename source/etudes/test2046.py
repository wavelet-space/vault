import math

def Z_0(rho: float, c: float, S: float) -> float:
    """
    Calculate a characteristic acoustic impedance :math:`Z_0`.
    """
    return (rho * c) / S

def k_lossless(lam):
    """
    Calculate a propagation number for lossless case.
    """
    return ((2 * math.PI) / lam)


def Z_IN(Z_0, Z_L, l, j, k):
    """
    Calculate a ... :math:`Z_L`.

    :param Z_0: A characteristic acoustic impedance.
    :param Z_L: A load impedance.
    :param l: ???
    :param j: ???
    :param k: A propagation number.
    """
    return Z_0 * ( 
        (Z_L + j * Z_0 * math.tan(k * l)) 
        / (Z_0 + j * Z_L * math.tan(k* l))
    )

if __name__ == "__main__":
    print(Z_0.__doc__)
    print(Z_IN.__doc__)
    print(k_lossless.__doc__)