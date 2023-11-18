#include <stdio.h>
#include "singly_linked_list.h"

node_t * Node_create(size_t value) 
{
    node_t *node = malloc(sizeof(node_t));

    if (!node) {
        return NULL;
    }

    node->next = NULL;
    node->value = value;

    return node;
}

bool Node_delete(node_t *node) 
{
    if (!node) {
        perror("You have tried to free a NULL pointer!");
        return false;
    }
    
    free(node);
    
    return true;
}

list_t * List_create(size_t value) 
{    
    list_t * list = malloc(sizeof(list_t));
    
    if (!list) {
        exit(1); // todo perror
    }

    node_t * node = Node_create(value);
    if (!node) {
        exit(1); // todo perror
    }

    list->head = node;

    return list;
}

list_t * list_create_empty()
{
    list_t * list = malloc(sizeof(list_t));
    
    if (!list) {
        exit(1); // todo perror
    }

    list->head = NULL;

    return list;
}

bool List_delete(list_t * list) 
{
    return false;
}

bool List_insert_head(list_t *list, size_t value) 
{
    if (!list) {
        perror("Not a valid list pointer!");
        exit(1); 
    }

    node_t *node = Node_create(value);
    if (!node) { // Memory allocation failed!
        return false;
    }

    if (!list->head) { // The list is empty.
        list->head = node;
    } else {
        node->next = list->head;
        list->head = node;
    }

    return true;
}

bool List_insert_tail(list_t *list, size_t value)
{
    if (!list) {
        perror("Not a valid list pointer!");
        exit(1); 
    }

    node_t *current_node = list->head;
    
    while  (current_node->next) {
        current_node = current_node->next;
    }

    node_t *node = Node_create(value); 
    if (!node) { // Memory allocation failed!
        return false;
    }

    current_node->next = node;
    node->next = NULL;

    return true;
}

bool List_remove_head(list_t *list) 
{
    if (!list) {
        perror("Not a valid list pointer!");
        exit(1);
    }   

    node_t *head = list->head;

    if (!head) { // List is empty.
        return true;
    }
    
    list->head = head->next;

    if (!Node_delete(head)) {
        exit(1);
    }

    return true;
}

bool List_remove_tail(list_t *list) 
{
    if (!list) {
        perror("Not a valid list pointer!");
        exit(1);
    }

    node_t *head = list->head;

    if (!head) { // List is empty.
        return true;
    }

    node_t *current = head;
    node_t *previous = NULL;

    while (current->next) {
        previous = current;
        current = current->next;
    }

    previous->next = NULL;
    
    if (!Node_delete(current)) {
        return false;
    }

    return true;
}

size_t List_length(const list_t *list) 
{
    if (!list->head) {
        return 0;
    }

    size_t count = 1;
    
    node_t *current_node = list->head;
    
    while (current_node->next) {
        ++count;
        current_node = current_node->next;  
    }

    return count;
}

void List_print(const list_t *list, const char *format)
{   
    if (!list) {
        perror("List NULL pointer exception.");
        exit(1);
    }

    node_t *current = list->head;

    while (current) {
        printf(format, current->value);
        current = current->next;
    }
}

int main() 
{
    list_t *list = List_create(3);
    printf("%lu\n", List_length(list));

    List_insert_head(list, 2);
    printf("%lu\n", List_length(list));
    
    List_insert_head(list, 1);
    printf("%lu\n", List_length(list));
    
    List_insert_tail(list, 3);
    printf("%lu\n", List_length(list));
    
    List_insert_tail(list, 5);
    printf("%lu\n", List_length(list));
    
    List_insert_tail(list, 6);
    printf("%lu\n", List_length(list));
    
    List_remove_head(list);
    printf("%lu\n", List_length(list));
    
    List_remove_tail(list);
    printf("%lu\n", List_length(list));

    List_print(list, "%lu\n");
}