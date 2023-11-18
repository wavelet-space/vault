/*
  Definuje jednosměrný prvek
*/
#ifndef SNODE_H
#define SNODE_H

struct node {
    void * value;
    struct node * next;
};

struct dnode {
    void * value;
    struct dnode * prev;
    struct dnode * next;
};

#define NODE_EXISTS(node) \
        if (!node) { \
            fprintf(stderr, "Cannot alocate a memmory!"); \
            exit(-1); \
        }

/** vytvoří prvek */
#define NODE_ALLOC \
        malloc(sizeof(struct node));

/** nastavý hodnoty prvku */
#define NODE_SET \
        node = NODE_ALLOC; \
        node->value = value; \
        node->next = NULL;

/** odstraní prvek */
#define NODE_DELETE(node) \
        free(node); node = NULL;                                                              \

#endif
