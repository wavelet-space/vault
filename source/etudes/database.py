"""
Table 
"""

class Series:

    def __init__(self) -> None:
        pass

    def __eq__(self, that: object) -> bool:
        pass


class Record:

    def __init__(self) -> None:
        pass

    def __eq__(self, that: object) -> bool:
        pass


class Table:
    """
    A,B,C: series (columns)
    1,2,3: records (rows)
       
    |0|A|B|C|
    |-|-|-|-|
    |1|a|b|c|
    |-|-|-|-|
    |2|d|e|f|
    |-|-|-|-|
    |3|g|i|j|
    
    """
    def __init__(self) -> None:
        pass

    def __getitem__(self, index: int) -> Series:
        ...


if __name__ == "__main__":
    ...
