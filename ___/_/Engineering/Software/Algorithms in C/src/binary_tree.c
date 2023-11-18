#include "binary_tree.h"


#include <stdio.h>


struct binary_tree * create_binary_tree(
	int value, struct binary_tree *child1, struct binary_tree *child2)
{
	struct binary_tree *tree = malloc(sizeof(struct binary_tree));
	
	if (tree == NULL) {
		//exit(-1)
	}
	
	tree->child1 = child1;
	tree->child2 = child2; 
	
	return tree;
}

void delete_binary_tree(* binary_tree) 
{


}



int main(int argc, char const *argv[])
{
	struct binary_tree *tree = create_binary_tree(1, NULL, NULL);

	printf("%d\n", tree->value);
	printf("%p\n", tree->child1);
	printf("%p\n", tree->child2);
}
