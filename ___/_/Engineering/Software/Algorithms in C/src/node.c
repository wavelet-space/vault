#include <stdlib.h>  // malloc, free
#include <stdio.h>   // printf
#include <assert.h>

#include "node.h"


void node_delete(struct node * node)
{
    // pokud by value byl typ alokován pomocí malloc()
    // museli bychom odstranit i tento prvek pomocí free()
    free(node);
    node = NULL;
}

static void print_node_value(struct node * node)
{
    printf("%d", *(int *)node->value);
}

#ifdef DEBUG_MODE
//-----------------------------------------------------------------------------
int main()
{
    struct node * n = node_new((int *) 1);
    //assert((node *)n != NULL);
    printf("%d\n", *(int *) &n->value);
    n->value = (int *)2;
    //assert(n->value = NULL);

    return 0;
}
//-----------------------------------------------------------------------------
#endif // DEBUG_MODE