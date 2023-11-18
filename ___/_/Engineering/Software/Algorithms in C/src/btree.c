#include <stdlib.h>

#include "tree.h"

/* modul functions */

neo_node_t * neo_bs_tree_new_node_(void * data);
bool neo_bs_tree_delete_node_(neo_bs_tree_t * node);

neo_node_t * neo_bs_tree_new_node_(void * data)
{
    neo_node_t * node = neo_node_new(& data);

    return node;
}

void neo_bs_tree_delete_node (neo_node_t * node)
{
    neo_node_delete(& node);
}

/* function definitions */

/*
--------------------------------------------------------------------------*/
neo_bs_tree_t * neo_bs_tree_new(void * data)
{
    neo_bs_tree_t * tree = malloc(sizeof *tree);
    neo_node_t * tree_root = neo_node_new(data);

    if (tree != NULL && tree_root != NULL) {
        tree->root = tree_root;
        tree->size = 1;

        return tree_root;
    }
    else {
        stderr
        exit();
    }

}

/*
--------------------------------------------------------------------------*/
bool neo_bs_tree_delete(neo_bs_tree_t * tree)
{
    if (NULL == tree->root && 0 == tree->size) {
        free(tree);
    }
    else {
        neo_node_t * node = tree->root;

        while(tree->left || tree->right) {
            neo_bs_tree_delete(tree->root->left);
            neo_bs_tree_delete(tree->root->right)
        }
    }
}

/*
--------------------------------------------------------------------------*/
bool neo_bs_tree_is_empty(neo_bs_tree_t * tree)
{
    if (NULL == tree->root && 0 == tree->size) {
        return true;
    }
    return false;
}

/*
--------------------------------------------------------------------------*/
unsigned int neo_bs_tree_get_size(neo_bs_tree_t * tree)
{
    /*--*/
    return tree->size;
}

/*
--------------------------------------------------------------------------*/
void neo_bs_tree_insert_node(neo_bs_tree_t * tree, void * data)
{
    neo_node_t * node = neo_bs_tree_new_node_(data);

    if (NULL == tree->root) {
        tree->root = node;
        tree->root->left = NULL;
        tree->root->right = NULL;
    }
    else {
        // TODO
    }

    free(node);
}

/*--------------------------------------------------------------------------*/
bool neo_bs_tree_remove_node(neo_bs_tree_t * tree, void * data) {
    return true;
    /* TODO */
}

/*--------------------------------------------------------------------------*/
bool search_node_rec(neo_bs_tree_t * tree, void * target)
{
    if (NULL == tree) {
        return false;
    }
    else if (target == tree->root->data) {
        return true;
    }
    else if (target < tree->root->data) {
        return (search_node_rec(tree->root->left, target));
    }
    else {
        return (search_node_rec(tree->root->right, target));
    }
}

/*--------------------------------------------------------------------------*/
void * search_iterative(neo_node_t * node, void * target)
{
    while (1) {
        if (NULL == node) {
            return -1;
        }
        else {
            return 0;
        }
    }
}
/* TREE_C */
