
from collections.abc import Iterable, Callable


class Task[T]:
 
    def __init__(self, value: T):
        self.value = value
 
    def __rshift__(self, operation: Callable):
        self.value = operation(self.value)
        yield self
    
    
# linear pipline
xs = (Task("a list of wordsss") >> len)

# branching pipeline

print( (list(xs.value)) ) 
