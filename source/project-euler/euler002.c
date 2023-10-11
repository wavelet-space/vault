/**
 * 002 <http://projecteuler.net>
 * David Landa
 */
#include <stdio.h>

int main (void)
{
    int fib0 = 0, fib1 = 1, fib = 0, sum = 0;

    while (fib < 4000000) {

        fib  = fib0 + fib1;
        fib0 = fib1;
        fib1 = fib;

        if (fib % 2 == 0) {
           sum += fib;
        }
    }
    printf("%d\n",sum);

    return 0;
}
