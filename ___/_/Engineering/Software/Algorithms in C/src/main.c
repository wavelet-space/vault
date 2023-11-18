/****************************************************************
 * @file main.c
 * @brief Implementační soubor pro jednosměrný spojový seznam.
 *
 * @author David Landa
 * @change 2014-06-23
 *
 ****************************************************************/
#include <stdio.h>
#include <stdlib.h>

#include "slist.h"

int main()
{
    list_t * list = list_create();
    if (!list)
    {
        printf("ERROR");
    }

    //Vkládáme prvky na konec seznamu.
    for (int i = 'a'; i < 'f'; i++)
    {
        list_insert_last(list, i);
        printf("%d:%c ... %c\n---\n", list->size, list->head->value, list->tail->value);
    }

//    // Odebíráme prvky ze zaèátku seznamu.
//    for (int i = 'e'; i > 'a'; i--) {
//        List_Remove_Node_From_Begin(list);
//        printf("%d:%c ... %c@n---@n", list->size, list->head->value, list->tail->value);
//    }
//
//    for (int i = 'd'; i >= 'a'; i--) {
//        List_Insert_Node_To_Begin(list, i);
//        printf("%d:%c ... %c@n---@n", list->size, list->head->value, list->tail->value);
//    }

    //List_Clear(list);
    printf("%d\n", list->size);

    // List_Traverse_From_Begin(list);
    printf("\n");

    list_get_first(list);
    printf("%d\n", list->size);


//    node_t {
//		void *value;
//		node_t *next;
//	};
//
//	node_t *head = malloc(sizeof(node_t));
//	head->value = 'a';
//	head->next = malloc(sizeof(node_t));
//	head->next->value = 'b';
//	head->next->next = malloc(sizeof(node_t));
//	head->next->next->value = 'c';
//	head->next->next->next = NULL;
//
//
//
//    printf("@n---@n");
//
//    // Vypíšeme hodnoty uzlů seznamu.
//
//    node_t  *current = head;
//
//    if (current != NULL) {
//        while(current != NULL) {
//            printf("[%c]->", current->value);
//            current = current->next;
//        }
//        printf("NULL@n");
//    }
//    else {
//        printf("EMPTY@n");
//    }
//
//
//    /*------------------------------*/
//
//	if (head != NULL)
//    {
//        // Odstraníme prvek ze začátku seznamu.
//        current = head->next;
//        free(head);
//        head = current;
//
//        // Vypíšeme hodnoty uzlů seznamu.
//        while(current != NULL) {
//            printf("[%c]->", current->value);
//            current = current->next;
//        }
//        printf("NULL@n");
//    }
//    else {
//        printf("EMPTY!@n");
//    }


    return 0;
}
