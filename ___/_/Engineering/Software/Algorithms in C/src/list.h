/*-----------------------------------------------------------------------------
  Simple singly linked list.

  $version: O.1.0
  $license: MIT <http://opensource.org/licenses/MIT>; (c) 2015 David Landa
  $authors: David Landa <david.landa@rozhlas.cz>

  [N]<-[x]<-[y]<-[z]

  Sentinel nodes

  Prázdný seznam:
  Seznam je prázdný, pokud neobsahuje žádný prvke. Pokud používáme

  Operace se seznamem
  ----------------------
  slist * slist_new        (void);
  void    slist_delete     (slist *list);
  void    slist_clear      (slist *list);
  void    slist_sort       (slist *list);
  void    slist_reverse    (slist *list);

  size_t slist_getsize(slist *list);

  Operace se prvky seznamu
  -------------------------
  void slist_append(slist *list, void * data);
  void slist_preppend(slist *list, void * data);
  void slist_insert_after()
  void slist_insert_before()
  void slist_insert_instead()
  void slist_remove(slist *list);
  void slist_remove_first(slist *list);
  void slist_remove_last(slist *list);
  void slist_swap(slist *list, node *node1, node *node2);
-----------------------------------------------------------------------------*/
#ifndef LIST_H
#define LIST_H

#include "node.h"

#define LIST_EXISTS(list) \
        if (!list) { \
          fprintf(stderr, "List doesn't exists!"); \
          exit(1); \
        }

/**
 * The list data structure.
 */
struct list {
    struct node * head;  /**< The pointer to the first node */
    unsigned size;
};

/**
 * Creates a list data structure.
 * @returns the list pointer
 */
struct list * list_new(void);

/**
 * Odstraní všechny prvky a celý seznam.
 * O(n)
 * @param the pointer to list structure
 */
void list_delete(struct list * list);

/**
 * Odstraní všechny prvky ze seznamu.
 * The time complexity: O(n)
 * @param the pointer to list structure
 */
void list_clear(struct list * list);

/**
 * Returns the first list item.
 * The time complexity: O(1)
 * @param the pointer to the list
 */
struct node * list_get_head(const struct list * list);

/**
 * Returns the last list item.
 * The time complexity: O(n)
 * @param the pointer to the list
 */
struct node * list_get_tail(const struct list * list);

/**
 * Vrací aktuální velikost seznamu.
 * The time complexity: O(1) -- Without storing a `size` field O(n).
 * @param the pointer to list structure
 */
unsigned int list_get_size(const struct list * list);

/**
 * Přidá prvek na začátek seznamu (preppend).
 * The time complexity: O(1)
 * @param the pointer to list structure
 */
void list_insert_head(struct list * list, void * value);

/**
 * Přidá prvek na konec seznamu (append).
 * The time complexity: O(n)
 * @param the pointer to list structure
 */
void list_insert_tail(struct list * list, void * value);

// void list_remove_head(struct list * list);
// void list_remove_tail(struct list * list);
// void list_remove_at(struct list * list, unsigned int index);

/**
 * Vytiskne seznam v čitelné podobě (human-readable).
 * O(1)
 * @param the pointer to list structure
 */
void list_print(const struct list * list);

/**
 * Vytiskne všchny prvky seznamu v čitelné podobě (human-readable)
 * O(n)
 * @param the pointer to list structure
 */
void list_print_nodes(const struct list * list);

/**
 * Projde všechny prvky seznamu a aplikuje na ně zadanou funkci.
 * @param the pointer to list structure
 */
 void list_for_each(struct list *);

#endif //<< LIST_H
