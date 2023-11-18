#ifndef SINGLY_LINKED_LIST_H
#define SINGLY_LINKED_LIST_H

/**
 * @brief   Singly Linked List data structure.
 * @file    singly_linked_list.h
 * @author  David Landa <david.landa@protonmail.com>
 *
 * We provide two constructor functions:
 *
 * 1. You provide the *list_t and we only fill it with data.
 * 2. TODO You provide the data and we allocate memory for you.
 *
 * The `n` in the time complexity value is the length of the list.
 */

#include <stddef.h>
#include <stdlib.h>
#include <stdbool.h>

/*
 * The list node.
 */
typedef struct node_t {
  size_t value;
  struct node_t *next;
} 
node_t;

/**
 * The list data structure.
 */
typedef struct list_t {
    struct node_t *head; //<< Pointer to the head of the list.
    //size_t size;
} 
list_t;

/**
 * Creates the new list node with the given value.
 *  
 * @param value A list node value.
 * @return The new valid node pointer or NULL if memory allocation fails.
 */ 
node_t * Node_create(size_t value);

/**
 * Normally the `free()` doesn't care if you insert the NULL, but we care!
 *
 * @param node A node to delete.
 * @return The `true` if the given pointer was valid, otherwise `false`;
 */
bool Node_delete(node_t *node);

/**
 * Create a new non empty list.
 *
 * @param value A list node value.
 * @return The new list. 
 */
list_t * List_create(size_t value);

/**
 * Create a new non empty list.
 *
 * @return The new empty list. 
 */
list_t * List_create_empty(); 

/**
 * Delete the existing list.
 *
 * Time complexity: 0(n)
 * 
 * @param list  
 */
bool List_delete(list_t *list);

/** 
 * Insert a new node at the head of the list.
 *
 * Time complexity: O(1);
 * 
 * @param list
 * @param value
 * @return The `true` if node was properly inserted, otherwise `false`;
 */
bool List_insert_head(list_t *list, size_t value);

/**
 * Insert a new node at the tail of the list.
 *
 * Time complexity: O(n).
 * 
 * @param list
 * @param value
 * @return The `true` if node was properly inserted, otherwise `false`;  
 */
bool List_insert_tail(list_t *list, size_t value);

/**
 * @param
 */
bool List_remove_head(list_t *list);

/**
 * @param
 */
bool List_remove_tail(list_t *list);

/**
 * @param
 */
size_t List_length(const list_t *list);


void List_print(const list_t *list, const char*);

#endif