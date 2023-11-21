# Get a value from nested dictionary without raising an exception

## Problem

In Python a dictionaries can be easily nested like the following.

```py
data = {
    "key": {
        "key": {
            "key": 1
        }
    }
} 
```

How can we extract a nested value from this dictionary without raising an exception?

## Solutions

```py

try:
    value = data.get("key", {}.get("key", {}).get("WRONG", {})    
except:
    value = None
```

```py
value = data.get("key", {}).get("key", {}).get("WRONG")
```

A custom function using iteration.

```py
def deep_get(data: dict, *keys: str, default= None) -> Any:
    assert len(keys) > 0  # debugging
    for key in keys:
        data = data.get(key, None)
        if data is None:
           break
    return data or default
```

A custom function using recursion.

```py
# TODO
```

## Resources

- [StackOverflow questions 25833613](https://stackoverflow.com/questions/25833613/safe-method-to-get-value-of-nested-dictionary)
