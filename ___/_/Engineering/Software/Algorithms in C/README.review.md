
Nástroje


gcc/clang
valgrind


HEAP v BST

Kdy použít *heap* a kdy *binární vyhledávací strom*?

HEAP je efektivní při průměrném vkládání O(1).
HEAP je efektivní `O(1)` při vyhledávání min XOR max hodnoty.
BST je efektivní při vyhledávání min AND MAX hodnoty.
BST je efektivní `O(log(N))` při obecném vyhledávání.


# Datové struktury implementované v C

**Pozor, práce je v ranném stádiu vývoje.**

## Jednosměrný spojový seznam
*Singly Linked List*

## Obousměrný spojový seznam
*Doubly Linked List*

## Kruhový spojový seznam
*Circular Linked List*

## Binární vyhledávací strom
*Binary Search Tree*

## Dynamické pole
*Dynamic Array*

## Zásobník
*Stack*

## Fronta
*Queue*


## Zdroje
https://github.com/GNOME/glib/


#Poznámky k ukazatelům

Ukazatele by měli být inicializovány co nejdříve a ideálně ihned při deklaraci.
Nikdy se nepokoušíme získat hodnotu (derefencovat) neinicializovaný ukazatel!
Ukazatel inicializovaný pomocí jiného ukazatele je obzvlášě nebezpečný:


```
#!C++
    int x = 1;
    int * p = &x;
    int * q = p;
    free(p) // kam ukazuje nyní q?
```

Pravidla pro ukazatele -- aneb jak se nezbláznit z hvězdiček.
Protože se znak `*` používá při práci s ukazateli jak k jeho deklaraci tak k
dereferenci, mohou nám pomoci tato pravidla:

Pokud je hvezdička před rovnítkem, pak chceme na místo kam ukzauje p uložit hodnotu:


```
#!C++

    int x = 1;
    int * p = &x;
    *p = 2;
```


    Ulož hodnotu `x` na místo kam ukazuje `p`.

Pokud je hvezdička za rovnítkem, pak se znažíme získat hodnotu na kterou ukazuje p.

```
#!C++
    int x;
    x = *p
```

Pořadí deklrací v hlavičkovém souboru: @see http://www.stack.nl/~dimitri/doxygen/commands.html
  
*   Constant declarations
*   Type declarations
*   Stucture declarations
*   Variable declarations
*   Macro declarations
*   Function prototypes

## LINKS

http://www.sorting-algorithms.com/
http://bost.ocks.org/mike/algorithms/
http://www.comp.nus.edu.sg/~stevenha/visualization/
http://interactivepython.org