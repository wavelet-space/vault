# Python Logging

Logging is an important part off any application and can be usefull in libraries either, especially
when the library implement some network calls e.g. calling REST or database server.

## Rules for a library

**Don't configure logging in a library code.** It is an applications responsibility.
You only setup logger object and document that user can use logging from standard library.

Import the logging module with `import logging`.

```py
logging.geLogger("LIBRARY_NAME").addHandler(logging.NullHandler())
```

```py
logging.getLogger("LIBRARY_NAME").propagate = False
```

## Rules for an Application

```py
logging.basicConfig()
```
