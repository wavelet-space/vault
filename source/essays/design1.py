from dataclasses import dataclass
from typing import Optional

@dataclass
class FindCustomer:
    custommer_id: int


class Customer:
    
    def __init__(self, id: int, name: str) -> None:
        self.id = id
        self.name = name
    
    def __eq__(self, other) -> bool:
        ...
    
    def __hash__(self) -> int:
        ...


def find_customer(customer_id) -> Optional[Customer]:
    # The domain logic aka use-case
    ...


def handle_find_custommer(command: FindCustomer) -> Optional[Customer] | Exception:
    # get command and pass it to use case.
    # if not validate(command):
    #     return Exception("reason")
    try:
        customer = find_customer()
        result = customer
    except Exception as error:
        result = error

    # Send error to `stderr`.
    # or 
    # Send data to `stdout` 
    return result


def main():
    ...


if __name__ == "__main__":
    main()