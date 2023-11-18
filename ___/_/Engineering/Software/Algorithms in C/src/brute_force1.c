#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#define TEST_MODE

// #ifndef TEXT_ALGORITHM_H
// #define TEXT_ALGORITHM_H

/**
 * Search for the patern in the given word.
 *
 * @param pattern The pattern which we are searching for.
 * @param word The word which in we are searching for the given pattern.
 */
bool brute_force1(const char * pattern, const char * word);
//bool brute_force2(const char * pattern, const char * word);

// #endif

bool brute_force1(const char * pattern, const char * word)
{

    size_t n = strlen(word);
    size_t m = strlen(pattern);

    if (m > n) {
        return false;
    }

    for (size_t i = 0; i < (n - m); ++i) {
        size_t count = 0;
        for (size_t j = 0; j < m; ++j) {
             if(word[i + j] == pattern[j]) {
                ++count;
             }
        }
        if (count == m) {
            return true;
        }
    }

    return false;
}

#ifdef TEST_MODE
//-----------------------------------------------------------------------------
int main()
{
    char * w1 = "a-b-c-d-e-f";
    char * w2 = "A-B-C-D-E-F";

    char * p[6] = {
        "a",
        "a-b",
        "a-b-c",
        "a-b-c-d",
        "a-b-c-d-e",
        "a-b-c-d-e-f"
    };

    printf("\n%s\n", "--- TEST ---");

    for (size_t i = 0; i < 5; ++i) {
        if (brute_force1(p[i], w1)) {
            printf("%s\n", "PASSED");
        }
        else {
            printf("%s\n", "FAILED");
        }
    }

    printf("\n%s\n", "--- TEST ---");

    for (size_t i = 0; i < 5; ++i) {
        if (! brute_force1(p[i], w2)) {
            printf("%s\n", "PASSED");
        }
        else {
            printf("%s\n", "FAILED");
        }
    }

    return 0;
}
//-----------------------------------------------------------------------------
#endif
