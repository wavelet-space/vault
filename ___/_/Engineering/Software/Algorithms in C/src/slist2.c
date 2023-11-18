#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include "config.h"
#include "list.h"

#define DEBUG_MODE 1

/**
 * Prohodí prvky seznamu na zadaných pozicích.
 * @param
 */
//void slist_swap(slist *list, node *node1, node *node2);

/**
 * Seřadí prvky seznamu.
 * @param ukazatel na seznam
 */
//void slist_sort(slist *list);

struct list * list_new(void)
{
    struct list * list = malloc(sizeof(struct list));
    list->size = 0;
    list->head = NULL;

    return list;
}

void list_delete(struct list * list)
{
    LIST_EXISTS(list);
    // TODO for-each item: free(item); then free(list).
}

void list_clear(struct list * list)
{
    LIST_EXISTS(list);
    // TODO for-each item: free(item).
}

inline struct node * list_get_head(const struct list * list)
{
    LIST_EXISTS(list);

    return list->head;
}

inline struct node * list_get_tail(const struct list * list)
{
    LIST_EXISTS(list);

    struct node * current_node = list->head;

    while(current_node->next)
    {
        current_node = current_node->next;
    }

    return current_node;
}

unsigned int list_get_size(const struct list * list)
{
    LIST_EXISTS(list);

    return list->size;
}

void list_insert_head(struct list * list, void * value)
{
    LIST_EXISTS(list);

    struct node * new_node = NODE_ALLOC;
    new_node->value = value;
    new_node->next = NULL;

    NODE_EXISTS(new_node);

    if (!list->head) {
        list->head = new_node;
    } else {
        new_node->next = list->head;
        list->head = new_node;
    }

    list->size++;
}

void list_insert_tail(struct list * list, void * value)
{
    LIST_EXISTS(list);

    struct node * current_node = list->head;
    struct node * new_node = NODE_ALLOC

    NODE_EXISTS(new_node);

    new_node->value = value;
    new_node->next = NULL;

    if (!current_node) {
        list->head = new_node;
    } else {
        while(current_node->next) {
            current_node = current_node->next;
        }

        current_node->next = new_node;
        list->size++;
    }
}

void list_print(const struct list * list)
{
    LIST_EXISTS(list);
    // TODO
}

void list_print_nodes(const struct list * list)
{
    LIST_EXISTS(list);

    struct node * current_node = list->head;

    if (current_node) {
        while (current_node) {
            printf("[%d]-->", *(int *) &current_node->value);
            current_node = current_node->next;
        }
        printf("NULL\n");
    } else {
        printf("%s\n", "List is empty!");
    }
}


void list_for_each(struct list * list)
{
    LIST_EXISTS(list);
    while(0) {
        //
    }
}

#ifdef DEBUG_MODE
//-----------------------------------------------------------------------------
int main()
{
    struct list * list = list_new();

    printf("list-size: %d\n", list_get_size(list));

    list_insert_head(list, (int *) 3);
    list_insert_head(list, (int *) 2);
    list_insert_head(list, (int *) 1);

    printf("list-size: %d\n", list_get_size(list));

    list_insert_tail(list, (int *) 4);
    list_insert_tail(list, (int *) 5);
    list_insert_tail(list, (int *) 6);

    printf("list-size: %d\n", list_get_size(list));

    list_print_nodes(list);

    return 0;
}
//-----------------------------------------------------------------------------
#endif // DEBUG_MODE