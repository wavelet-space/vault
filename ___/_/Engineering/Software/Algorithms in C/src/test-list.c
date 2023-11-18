#include <stdio.h>
#include <stdlib.h>

struct node {
    int value;
    struct node * next;
};

int length(struct node * head)
{
    struct node * current = head;
    int count = 0;

    while(current) {
        count++;
        current = current->next;
    }

    return count;
}

int main()
{

/*
Než začneme implementovat nějaké funkce,

    //struct node nodes[10];
    struct node * node = NULL;

    for (int i = 0; i < 10; i++) {
        struct node * new_node = malloc(sizeof(struct node));

        new_node->value = i;
        new_node->next = node;

        node = new_node;
    }

    for (int i = 0; i < 10; i++) {
        //printf("%d\n", node->value);
        node = node->next;
    }
*/
    //-------------------------------------------------------------------------
    // Vytvoříme jednotlivé prvky seznamu:
    //-------------------------------------------------------------------------
    struct node * root_node = NULL;

    root_node = malloc(sizeof(struct node));
    root_node->value = 1;
    root_node->next = malloc(sizeof(struct node));
    root_node->next->value = 2;
    root_node->next->next = malloc(sizeof(struct node));
    root_node->next->next->value = 3;
    root_node->next->next->next = NULL;

    //-------------------------------------------------------------------------
    // Vypíšeme hodnoty všech prvků seznamu:
    //-------------------------------------------------------------------------
    struct node * current_node = root_node;

    while (current_node) {
        printf("<node-value: %d; node-address: %p>\n", current_node->value,
                                                       (void *)current_node);
        current_node = current_node->next;
    }

    printf("%s\n", "----");
    //-------------------------------------------------------------------------
    // Odstraníme všechny prvky seznamu:
    //-------------------------------------------------------------------------
    current_node = root_node;
    struct node * tmp = NULL;

    while (current_node) {
        tmp = current_node;
        current_node = current_node->next;
        printf("<tmp-value: %d; tmp-address: %p>\n", tmp->value, (void *)tmp);
        free(tmp);
        tmp = NULL;  // Toto není nutné, ale vhodné:
        //printf("<tmp-value: %d; tmp-address: %p>\n", tmp->value, (void *)tmp);
    }



    return 0;
}
