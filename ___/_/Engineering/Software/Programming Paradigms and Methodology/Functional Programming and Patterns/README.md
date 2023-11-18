---
title: Funkcionální programování
---

# Funkcionální programování


# Funktor

Funktor je typová třída (Haskell `class`, Scala `trait`).
Nějaký Ttp patří do rodiny funktorů, pokud je pro něj definována funkce `fmap`.

```haskell
fmap :: (a -> b) -> f a -> f b
        ^            ^------^--- kontajer prvků a kontajner prvků b
        ------------------------ funkce mapující a na b
```


Typová definice funktoru obsahující metodu `fmap`.

```haskell
class Functor f where
    fmap :: (a -> b) -> f a -> f b
```

Konkrétní instance funktoru pro seznam.

```haskell
instance Functor [] where
    fmap = map            -- alias na `map`
```

Konkrétní instance funktoru pro typ `Maybe` a `Either`.

```haskell
data Maybe a = Nothing | Just a
    deriving (Eq, Ord)
```

```haskell
instance Functor Maybe where
    fmap _ Nothing = Nothing
    fmap f (Just a) = Just (f a)
```

```haskell
intsance Functor Either where
    fmap _ (Left a) = Left a
    fmap f (Right a) = Right (f a)
```


# Odkazy

- Monday Morning Haskell: Functors; https://mmhaskell.com/monads/functors
- Graham Hutton: FP6; https://www.youtube.com/watch?v=bOpJQDGYoKw&ab_channel=GrahamHutton

