"""
The strategy s function.
"""


from typing import Callable, Tuple


Strategy = Callable[[int, int], int]


def strategy_A(a: int, b: int) -> int:
    return a + b


def strategy_B(a: int, b: int) -> int:
    return a - b


def strategy_C(a: int, b: int) -> int:
    return a * b


class Service:
    def __init__(self, strategy):
        self._strategy = strategy

    @property
    def strategy(self) -> Strategy:
        return self._strategy

    @strategy.setter
    def strategy(self, strategy: Strategy) -> None:
        self._strategy = strategy


    def process(self, a, b) -> "Result":
        return self.strategy()


if __name__ == "__main__":
    # Use doctest

    e = Service(None)

    e.strategy = strategy_A
    a = e.process(1, 1)
    print(a)

    e.strategy = strategy_B
    b = e.process(1, 1)
    print(b)
