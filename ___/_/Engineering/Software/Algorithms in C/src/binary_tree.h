#include <stdlib.h>

/*
 Binary Search Tree
*/

struct binary_tree
{	
	int value;
	struct binary_tree * child1, * child2;
};

struct binary_tree *  binary_tree_create(struct binary_tree *root, int value);

void binary_tree_insert(int value);

void binary_tree_delete(* binary_tree);
