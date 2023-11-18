#include <stdio.h>
#include <stdlib.h>

#include "turtle.h"

// STATE
//-----------------------------------------------------------------------------
state_t * state_new(double x, double y, double a)
{
    state_t * new_state = malloc(sizeof(state_t));

    if (!new_state) {
        return NULL;         // The memmory alocation failed!
    }

    new_state->x = x;
    new_state->y = y;
    new_state->a = a;
    new_state->prev = NULL;  // Set this properly when pushing
                             // the item on the stack.
    return new_state;
}

// STACK
//-----------------------------------------------------------------------------
stack_t * stack_new(void)
{
    stack_t * new_stack = malloc(sizeof(stack_t));
    new_stack->top = NULL;
    new_stack->size = 0;

    return new_stack;
}

// NODE --jakýkoliv prvek přidávaný do seznamu
//-----------------------------------------------------------------------------

// single list node
struct snode_s {
    void * value;
    struct snode_s * next;
};

// double list node
struct dnode_s {
    void * value;
    struct dnode_s * prev;
    struct dnode_s * next;
};


void stack_delete(stack_t * stack)
{
    if (stack->top) {                // The stack size > 0?
        state_t * tmp = stack->top;
        while (tmp) {
            stack_pop(stack);
            tmp = stack->top;
        }
    }
    free(stack);                     // If stack don't exists, nothing happen!
}

int stack_push(stack_t * const stack, fun_pt fn_new, ...)
{
    state_t * new_item = fn_new(1, 2, 3);

    if (! new_item) {
        return EXIT_FAILURE;    // Memory alocation failed!
    }

    if (! stack->top) {         // Is the stack empty?
        stack->top = new_item;
    } else {
        new_item->prev = stack->top;
        stack->top = new_item;
    }

    stack->size++;
    return EXIT_SUCCESS;
}

void stack_pop(stack_t * const stack)
{
    if (stack) {                               // stack exists?
        if (stack->top) {                      // stack size > 0?
            state_t * tmp = stack->top->prev;
            free(stack->top);
            stack->size--;
            stack->top = tmp;
        }
    }
}

void print_stack(stack_t * const stack, ...)
{
    if (stack->top) {
        printf("<stack: {%d}; [%f, %f, %f]>\n", stack->size,
                                                stack->top->x,
                                                stack->top->y,
                                                stack->top->a);
    } else {
        printf("<stack: {%d}; [stack is empty]>\n", stack->size);
    }
}

void print_stack_items(stack_t * const stack)
{
    state_t * tmp = stack->top;

    printf("\nstack-items:\n------------\n");
    while (tmp) {
        printf("<stack-item: %p>\n", (void *)tmp);
        tmp = tmp->prev;
    }
}

// MAIN
//-----------------------------------------------------------------------------
int main (int argc, char **argv)
{
    stack_t * stack = stack_new();
    //struct state_s state = malloc(sizeof(struct state_s));

    // PUSH TO STACK:
                                    print_stack(stack); //>> -
    stack_push(stack, state_new); //print_stack(stack); //>> 1
    stack_push(stack, state_new); //print_stack(stack); //>> 1, 2
    stack_push(stack, state_new); //print_stack(stack); //>> 1, 2, 3

    print_stack_items(stack);

    // POP FROM STACK:
    stack_pop(stack); print_stack_items(stack); //print_stack(stack); //>> 1, 2
    stack_pop(stack); print_stack_items(stack); //print_stack(stack); //>> 1
    stack_pop(stack); print_stack_items(stack); //print_stack(stack); //>> -
    stack_pop(stack);

    for (int i = 0; i < 20; i++) {
        stack_push(stack, state_new);
    }

    print_stack_items(stack);

    for (int i = 0; i < 1000; i++) {
        stack_pop(stack);
    }

    print_stack_items(stack);

    stack_delete(stack);
    printf("%s\n", "[---[OK]---]");

    return 0;
}
