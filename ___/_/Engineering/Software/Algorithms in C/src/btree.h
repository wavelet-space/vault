/**
 * Copyright (c) <year> <copyright holders>
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

/*===========================================================================
 * $ds_type: tree
 *
 *         Average   Worst
 * -----------------------
 * Space:  O(n)      O(n)
 * Search: O(log n)  O(n)
 * Insert: O(log n)  O(n)
 * Delete: O(log n)  O(n)
 * -----------------------
 *
 * BST -- Binary Search Tree (Ordered Binary Tree)
 *
 *       ---[0]---               0
 *       |       |           1       2
 *     -[1]-   -[2]-       3   4   5   6
 *     |   |   |   |
 *    [3] [4] [5] [6]
 *
 * Binární vyhledávací strom (též uspoořádaný vyhledávací strom) je definován
 * rekurzivně takto:
 * Strom je buď prázdný (reprezentovaný ukazatelem s hodnotou NULL) nebo je
 * tvořen jedným uzlem, jehož levý a pravý ukazatel každý ukazuje na strom.
 *=========================================================================*/
#ifndef NEO_BS_TREE_H
#define NEO_BS_TREE_H

#ifdef  __cplusplus
extern "C" {
#endif

#include <stdbool.h>

#include "node.h"

/* a tree type */

typedef struct neo_bs_tree_s {
    neo_node_t * root;
    unsigned int size;
} neo_bs_tree_t;

/* constructor */

/**
 * Vytvoří nový strom a inicializuje kořen.
 * @param data
 * @return pointer
 */
neo_bs_tree_t * neo_bs_tree_new(void * data);

/* destructor */

/**
 * Odstraní celý strom se všemi prvky.
 * @param pointer to a tree
 * @return bool
 */
bool neo_bs_tree_delete(neo_bs_tree_t * tree);

/* public functions */

/**
 * Zjistí jestli je strom prázdný
 * @param pointer to a tree
 * @return bool
 */
bool neo_bs_tree_is_empty(neo_bs_tree_t * tree);

/**
 * Vrátí aktuální velikost stromu
 * @param pointer to a tree
 * @return uint size
 */
unsigned int neo_bs_tree_get_size(neo_bs_tree_t * tree);

/**
 * Vloží prvek do stromu
 * @param pointer to a tree
 * @param data
 */
void neo_bs_tree_insert_node(neo_bs_tree_t * tree, void * data);

/**
 * Odstraní prvek ze stromu
 * @param pointer to a tree
 * @param data
 */
bool neo_bs_tree_remove_node(neo_bs_tree_t * tree, void * data);

/**
 * Rekurzivní verze vyhledávání
 * @param pointer to a tree
 * @param data
 */
bool neo_bs_tree_search_node(neo_bs_tree_t * tree, void * data); // rec + iter

#ifdef  __cplusplus
}
#endif

#endif /* NEO_BS_TREE_H */
