/**
 * 005 <http://projecteuler.net>
 * David Landa
 */
#include <stdio.h>

int main(void)
{
    int num = 21,
    int val = 1;

    while (val) {
        for (int i = 1; i <= 20; i++) {
            if (num%i == 0) {
            // todo
            }
        }
        if (num == 20) {
            printf("%ld", num);
            val = -1;
            break;
        }
    }
    return 0;
}
