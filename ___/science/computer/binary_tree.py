

from dataclasses import dataclass
from typing import Generic, Generator, TypeVar, Any


T = TypeVar("T") # Type must be comparable (<).


@dataclass(slots=True)
class Node(Generic[T]):
    value: T
    left: Any  = None
    right: Any = None


class AbstractTree(Generic[T]):
    
    def insert(self, value: T) -> None:
        """
        Insert a node with the given value.
        """
    
    def remove(self, value: T) -> None:
        """
        Remove a node with the given value.
        """
    
    def search(self, value: T) -> None:
        """
        Search a node with the given value.
        """


class BinaryTree(AbstractTree[T]):
    """
    The binary search tree.
    """

    __slots__ = ("root",)
    
    def __init__(self, value: T) -> None:
        self.root = Node(value, None, None)

    def insert(self, value: T) -> None:
        node = self.root
        while node is not None:
            if node.value > value: 
                node = node.left
            if node.value < value:
                node = node.right
        node = Node(value)

    def remove(self, value: T) -> None:
        ...

    def search(self, value: T) -> None:
        node = self.root
        while node is not None:
            print(node)
            if node.value == value: 
                return node.value
            node = node.left if value < node.value else node.right
        raise ValueError(str(value))


if __name__ == "__main__":

    tree = BinaryTree(0)
    tree.insert(1)
    tree.insert(2)
    tree.insert(3)
    tree.insert(4)

    print(
        tree.search(1)
    )