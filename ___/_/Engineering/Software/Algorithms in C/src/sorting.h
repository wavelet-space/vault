/*-----------------------------------------------------------------------------
  SORTING ALGORITHMS
  -----------------------------------------------------------------------------

  Compilation:
      `gcc sorting.c -o test -std=c99 -Wall -Werror -pedantic`
  or  `clang sorting.c -o test -std=c99 -Wall -Werror -pedantic`
  or  `make`

  SELECTION-SORT (also known as  *select-sort*)
  --------------------------------------------------------------
  An algorithm in category *in-place comparison sort*. It means, that for
  sorting an items no additional memmory is needed.

  Time complexity: O(n^2)
  Space complexity: O(1) (in-place -- no extra memory is needed)

  Variations: see also *coctail-sort*, *heap-sort*

  Implementation:
  ----------------
  --select_sort_1

  -- select_sort_3
  In this implementation we don't swap imediatly, when a next item value
  differ from base item. Insead we save a index to the `min` variable and on
  the end we swap the content of items -- of course  only if some value was
  greater then the base value.
-----------------------------------------------------------------------------*/
#ifndef SSALGORITHMS_H
#define SSALGORITHMS_H


void select_sort_1(int array[], size_t N);
void select_sort_2(int array[], size_t N);
void insert_sort(int array[], size_t N);
void bubble_sort(int array[], size_t N);
void quick_sort(int array[], size_t N);
void array_print_items(int array[], size_t N);

#define TEST_MODE

#define SWAP(x, y, T) do { T temp##x##y = x; x = y; y = temp##x##y; } while (0)

// Works only for integers!
#define ADD_SWAP(a, b) ()

// Works for each data types.
#define XOR_SWAP(a, b) ((a) ^= (b), (b) ^= (a), (a) ^= (b))

#define INT_ARRAY_SIZE(array) ( sizeof array  / sizeof *array )

inline void swap(void *va, void *vb, size_t s)
{
    char t; char *a = (char*)va; char *b = (char*)vb;
    while(--s) {
        t = a[s], a[s] = b[s], b[s] = t;
    }
}

#endif
