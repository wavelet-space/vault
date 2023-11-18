/*-----------------------------------------------------------------------------
  See the comments in the header file.
-----------------------------------------------------------------------------*/
#include <stdio.h>
#include <stdint.h>
#include "sorting.h"

void select_sort_1(int a[], size_t N)
{
    int tmp;
    for (size_t i = 0; i < N - 1; ++i) {
        for (size_t j = i + 1; j < N; ++j) {
            if (a[i] > a[j]) {
                tmp = a[i];
                a[i] = a[j];
                a[j] = tmp;
            }
        }
    }
}

void select_sort_2(int a[], size_t N)
{
    for (size_t i = 0; i < N - 1; ++i) {
        for (size_t j = i + 1; j < N; ++j) {
            if (a[i] > a[j]) {
                XOR_SWAP(a[i], a[j]);
            }
        }
    }
}

void select_sort_3(int a[], size_t N)
{
    int min;  //< index
    for (size_t i = 0; i < N - 1; ++i) {
        min = i;
        for (size_t j = i + 1; j < N; ++j) {
            if (a[min] > a[j]) {
                min = j;
            }
        }
        if (min > i) {
            XOR_SWAP(a[i], a[min]);
        }
    }
}

void insert_sort(int a[], size_t N)
{
    for (int i = 1; i < N; ++i) {
        for (int j = i; i > 0 && a[j - 1] > a[j]; --j) {
            XOR_SWAP(a[j], a[j-1]);
        }
    }
}

void a_print_items(int a[], size_t N)
{
    for (size_t i = 0; i < N; i++) {
        printf("%d ", a[i]);
    }
    printf("\n");
}

#ifdef TEST_MODE
//-----------------------------------------------------------------------------
int main()
{
    size_t N = 10;

    int arr1[] = {5, 7, 4, 1, 2, 0, 9, 8, 6, 3};  // random
    int arr2[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};  // sorted
    int arr3[] = {9, 8, 7, 6, 5, 4, 3, 2, 1, 0};  // reversed

    printf("--- TEST ---\n");
    select_sort_1(arr1, N); a_print_items(arr1, N);
    select_sort_1(arr2, N); a_print_items(arr2, N);
    select_sort_1(arr3, N); a_print_items(arr3, N);
    printf("------------\n");

    int arr4[] = {5, 7, 4, 1, 2, 0, 9, 8, 6, 3};
    int arr5[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    int arr6[] = {9, 8, 7, 6, 5, 4, 3, 2, 1, 0};

    printf("--- TEST ---\n");
    select_sort_2(arr4, N); a_print_items(arr4, N);
    select_sort_2(arr5, N); a_print_items(arr5, N);
    select_sort_2(arr6, N); a_print_items(arr6, N);
    printf("------------\n");

    int arr7[] = {5, 7, 4, 1, 2, 0, 9, 8, 6, 3};
    int arr8[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    int arr9[] = {9, 8, 7, 6, 5, 4, 3, 2, 1, 0};

    printf("--- TEST ---\n");
    select_sort_3(arr7, N); a_print_items(arr7, N);
    select_sort_3(arr8, N); a_print_items(arr8, N);
    select_sort_3(arr9, N); a_print_items(arr9, N);
    printf("------------\n");

    printf("--- TEST ---\n");
    int arr10[] = {5, 7, 4, 1, 2, 0, 9, 8, 6, 3};
    insert_sort(arr10, N); a_print_items(arr10, N);
    printf("------------\n");

    return 0;
}
//-----------------------------------------------------------------------------
#endif
