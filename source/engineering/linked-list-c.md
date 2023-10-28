# Linked List

# Jednosměrně vázaný spojový seznam.

Nejříve si ukážeme celý program: [program](github.gist)

# Imlementace bez funkcí, jen s použitím ukazatelů

Nejdříve si ukážeme implementace bez funkcí jen se samotnými ukazateli.

Vytvoříme strukturu `node`, která uchovává samotná data (zatím pro jednoduchost jen typu `int`) a odkaz (ukazatel) na další prvek, což je taktéž strukutra `node`.

```
struct node {
    int value;
    struct node * next;
};
```

První uzel, kterému se říká *head* nebo *root*, vytvoříme jako konstantní ukazatel, abysme ho nemohli později omylem změnit. Rovnou ho také incializujem a to tak, že alokujem paměť na haldě (*heap*).

```
struct node * const root_node = malloc(sizeof(struct node));
```

Pokud jsi zmatený ze zápisu `struct  node * const` podívej se na tento [článek](ConstPointer.html).

Nyní nastavíme hodnoty našeho prvního prvku (uzlu).
```
root_node->value = 1;
root_node->next = malloc(sizeof(struct node));
```
 
Ukazet na další prvek obsahuje nyní adresu nově vytvořeného prvku, takže opět nastavíme hodnoty tohoto dalšího prvku

```
root_node->next->value = 2;
root_node->next->next = malloc(sizeof(struct node));
```

Poslední prvek seznamu už bude ukazovat na hodnotu NULL, což bude značit konec seznamu.
```
root_node->next->next->value = 3;
root_node->next->next->next = NULL
```

## Průchod spojovým seznamem

Pro průchod spojovým sezname použijeme cyklus `while` -- vypíšeme si všechny hodnoty uložené v jednotlivých prvcích seznamu. Hodnotu ukazatele `current_node` inicializujem adresou kořene seznamu `root_node`. V cyklu vypíšeme hodnotu aktuálního prvku a poté uložíme hodnotu na další prvek.

```
struct node * current_node = root_node

while (current_node) {
    printf("<node-value: %d; node-address: %p>\n", current_node->value,
                                                   (void *)current_node);
    current_node = current_node->next;
}
```

## Odstranění všech prvků seznamu

Pro odstranění všech prvků seznamu použijem pozměněný while cyklus. Musíme navíc zavést pomocný ukazatel, do kterého si uložíme adresu aktuálního prvku, než aktualizujem ukazatel na další prvek v řadě. Aktuální prvek posléze bezpečně odstraníme  pomocí pomocného ukazatele a funkce `free()`.

```
struct node * current_node = root_node;
struct node * tmp = NULL;

while (current_node) {
    tmp = current_node;
    current_node = current_node->next;
    free(tmp);
}
