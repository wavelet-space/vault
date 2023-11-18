## Command Query Separation

> Functions that change state should not return values and functions that return values should not change state.

## Law od Demeter (for functions/methods)

> Method `M` of an object `O` may only invoke the methods of the following kinds of objects:
> - O itself
> - M's parameters
> - Any objects created/instantiated within M
> - O's direct component objects
> - A global variable, accessible by O, in the scope of M