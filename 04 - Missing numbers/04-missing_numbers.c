
/* Tuenti Challenge 3
*
* Challenge 4 - Missing numbers

* If the number's there I'll find it! 
*     -- Maximillian Cohen, Pi (1998)
*/

/* Compiled in Linux x86_64 with the command line:
   gcc -pedantic -Wall -O3 04-missing_numbers.c -o 04-missing_numbers
*/

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>
#include <byteswap.h>


#define BITMAP_SIZE (2147483648L / 8)
#define INTEGERS_FILE "integers"

#define MAX_MISSING 100

#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
#define swap_integer(x)  bswap_32(x)
#else
#define swap_integer(x) x
#endif

/**
 * Fills a bit map setting a 1 in each position a number has been seen
 * 
 */
void fill_bitmap(uint8_t* bitmap) {
    int fd;
    struct stat finfo;
    int32_t* pbegin;
    int32_t* p;
    int32_t number;
    int32_t pos;
    uint8_t mask;
    unsigned int i, number_of_integers;
    
    
    fd = open(INTEGERS_FILE, 0);
    fstat(fd, &finfo);
    
    number_of_integers = finfo.st_size / sizeof(int32_t);
    pbegin = mmap(NULL, finfo.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
    p = pbegin;
    
    for(i = 0; i < number_of_integers; i++, p++) {
        number = swap_integer(*p);
        pos = number / 8;
        mask = 1 << (number % 8);
        
        bitmap[pos] |= mask;
    }
        
    
    munmap(pbegin, finfo.st_size);
    
    close(fd);
}

int find_missing(const uint8_t* bitmap, int32_t* dest, int limit) {
    int32_t i;
    int32_t number;
    uint32_t b;
    int bit_count;
    int pos_dest = 0;
    
    
    /* Loop over the bit map finding the missing numbers */
    for (i = 0; i < BITMAP_SIZE; ++i, ++bitmap) {
        if (*bitmap != 0xFF) {
            b = *bitmap;
            number = i * 8;
            
            for(bit_count = 0; bit_count < 8; ++bit_count, b >>= 1, ++number) {
                if ((b & 0x01) == 0x00) {

                    dest[pos_dest++] = number;
                    if (pos_dest == limit)
                        return pos_dest;
                }
            }
        }
    }
    
    return pos_dest;
}


int main(void) {

    int num_cases;
    uint8_t* bitmap;
    int32_t missing[MAX_MISSING];
    int number;
    int i;
    int tmp;
    
    bitmap = (uint8_t*)calloc(1, BITMAP_SIZE);    
    fill_bitmap(bitmap);
    find_missing(bitmap, missing, MAX_MISSING);
    free(bitmap);
    
        
    tmp = fscanf(stdin, "%d", &num_cases);
    
    for(i = 0; i < num_cases; ++i) {
        tmp = fscanf(stdin, "%d", &number);
        printf("%d\n", missing[number - 1]);
    }
    
    tmp = tmp;  /* Just to avoid warnings */

    
    return 0;    
}

