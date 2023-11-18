/*

Navrhněte reprezentaci fronty v poli, která bude pracovat v konstantním čase. Mů-
žete předpokládat, že předem znáte horní odhad počtu prvků ve frontě.

*/

#include <stdio.h>
#include <stdlib.h>

/// Fronta s natvrdo nastaveným maximálním počtem prvků.
struct Queue  
{	
	char count;
	char **values;
};


/**
 * Vytvoří prázdnou frontu.
 */

struct Queue* Queue_create(char count) 
{
	struct Queue *queue = malloc(sizeof(struct Queue));
	
	if (NULL == queue) {
		return NULL; // memory error
	}

	queue->count = count;
	queue->values = malloc(count * sizeof(int));

	return queue;
}

void Queue_delete(struct Queue *queue)
{
	free(queue->values);
	free(queue);
}

/** 
 * Přidá prvek `x` na konec fronty.
 */
void Queue_enqueue(struct Queue* queue, int x)
{	

}

/** 
 * Odebere prvek ze začátku fronty.
 */
void Queue_dequeue(struct Queue* queue)
{

}


int main(int argc, char const *argv[])
{
	struct Queue* queue = Queue_create(100);
	
	printf("%d\n", queue->count);

	Queue_delete(queue);

	return 0;
}

