# -*- coding: utf8 -*-

"""
# Behaviral patterns: Strategy pattern

The stategy is an object.

TODO DocTests
"""

from abc import ABC, abstractmethod


class Strategy(ABC):
    @abstractmethod
    def execute(self, *args, **kwargs) -> "Result":
        pass


class Strategy_A(Strategy):
    def execute(self, a, b) -> "Result":
        return a + b


class Strategy_B(Strategy):
    def execute(self, a, b) -> "Result":
        return a * b


class Service:
    def __init__(self, strategy: Strategy):
        self._strategy = strategy

    @property
    def strategy(self) -> Strategy:
        return self._strategy

    @strategy.setter
    def strategy(self, strategy: Strategy) -> None:
        self._strategy = strategy

    def process(self, a, b) -> "Result":
        return self.strategy.execute(a, b)


if __name__ == "__main__":
    # Use doctest

    A = Strategy_A()
    B = Strategy_B()

    e = Service(None)

    e.strategy = A
    a = e.process(1, 1)
    print(a)

    e.strategy = B
    b = e.process(1, 1)
    print(b)
