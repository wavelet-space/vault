/**---------------------------------------------------------------
 * @brief Implementační soubor pro jednosmìrný spojový seznam.
 * @author David Landa
 * @change 2014-06-23
 * Overview:
 *---------------------------------------------------------------*/
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "slist.h"

slist * slist_create()
{
    slist * list = malloc(sizeof(slist)); // use calloc?
    list->size = 0;
    list->root = NULL;
    list->current = list->root;

    return list;
}

void slist_delete(slist *list)
{
    assert(list != NULL);

    if (list->current != NULL)
    {
        node *temporary;
        // free all nodes!
        while (list->current != NULL)
        {
            temporary = list->current;
            list->current = temporary->prev;
            free(temporary);
        }
    }

    free(list);
}

void slist_clear(slist *list)
{
    assert(list != NULL);

    if (list->current != NULL)
    {
        node *temporary;
        // free all nodes!
        while (list->current != NULL)
        {
            temporary = list->current;
            list->current = temporary->prev;
            free(temporary);
        }
    }
}

void slist_append(slist *list, void * data)
{
    assert(list != NULL);

    node *node = malloc(sizeof(node));
    node->data = data;
    node->prev = list->current;

    if (list->current == NULL)
    {
        list->root = node;
    }

    list->current = node;
    (list->size)++;
}

void slist_preppend(slist *list, void * data)
{
    assert(list != NULL);

    node *node = malloc(sizeof(node));
    node->data = data;
    node->prev = NULL;

    // pokud není seznam prázdný, nechť je prvek kořenem seznamu.
    if (list->current != NULL)
    {
        list->root->prev = node;
    }

    list->root = node;
    (list->size)++;
}

void slist_remove(slist *list)
{
    assert(list->root != NULL);
    // assert(list->size > 0);

    node *node = list->current;
    list->current = node->prev;
    (list->size)--;
    free(node);
};


size_t slist_getsize(slist *list)
{
    assert(list != NULL);

    return list->size;
}


void slist_tostring(slist *list)
{
    assert(list != NULL);

    printf("\n-------------\nlist overview\n-------------\n");
    printf("%-10s %8d\n", "item count:", list->size);

    if (list->size > 0)
    {
        printf("%-10s %8d[kb]\n", "item size:", sizeof(list->current));
        printf("%-10s %8d[kb]\n\n", "list size:", sizeof(list) +
               (list->size * sizeof(list->current)));
        slist_printallnodes(list);
    }
}


void slist_printallnodes(slist *list)
{
    assert(list != NULL);

    if (list->current == NULL)
    {
        printf("empty list!\n");
    }
    else
    {
        int array_list[list->size];

        for(size_t i = list->size; list->current != NULL; i--)
        {
            //array_list[i] = list->current->data;
            printf("%d\n", list->current->data);
            list->current = list->current->prev;
        }

        for (unsigned int i = 0; i < list->size; i++)
        {
            //printf("item[%d] : %d\n", i, array_list[i]);
        }
    }
}

//--------------------------------------
void slist_sort(slist *list)
{

}

int main(){
    slist * list = slist_create();
    slist_preppend(list, 1);
    slist_preppend(list, 2);
    slist_preppend(list, 3);
    slist_tostring(list);
    return 0;
}
