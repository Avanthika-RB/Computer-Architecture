#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
uint32_t string_to_uint(char *str) {
    uint32_t value = 0;
    int base = 10; //default
    if (str[0] == '0') { //checks the start of the string for 0b and 0x
        if (str[1] == 'b' || str[1] == 'B') {
            base = 2;
            str += 2; 
        } else if (str[1] == 'x' || str[1] == 'X') {
            base = 16; //if 0x, base is 16
            str += 2; 
        }
    }
    while (*str) { //iterates string to check for bad inputs
         if ((base == 2 && (*str != '0' && *str != '1')) ||
            (base == 10 && (*str < '0' || *str > '9')) ||
            (base == 16 && !((*str >= '0' && *str <= '9') ||
                             (*str >= 'a' && *str <= 'f') ||
                             (*str >= 'A' && *str <= 'F')))) {
            fprintf(stderr, "Bad input\n");
            exit(0);
        }
        value = value * base; //shifts left by 1
        if (*str >= '0' && *str <= '9') {
            value += *str - '0'; //output is a number
        } else if (*str >= 'a' && *str <= 'f') {
            value += *str - 'a' + 10;
        } else if (*str >= 'A' && *str <= 'F') {
            value += *str - 'A' + 10;
        }
        str++;  //next value in string
    }
    return value;
}
void int_to_string(uint32_t value, char *str, int base) {
    char store[33]; //stores string with 32 bits and null
    int index = 0;
    if (value == 0) {
        store[index++] = '0';
    } else {
        while (value > 0) {
            int digit = value % base; //get the last digit
            if (digit < 10) {
                store[index] = '0' + digit; //makes it a char
            } else {
                store[index] = 'a' + (digit - 10); 
            }
            index++;
            value /= base; 
        }
    }
    for (int i = 0; i < index; i++) { //reverse
        str[i] = store[index - i - 1];
    }
    str[index] = '\0';
}
void helperfn(uint32_t value, int argc, char *argv[]) {
    char result[33];
    int bin = 0; //initialize variables
    int dec = 0;
    int hex = 0; 
    for (int i = 2; i < argc; i += 2) { //find the base, then print in order
        if (strcmp(argv[i], "-o") == 0) {
            int base = string_to_uint(argv[i + 1]);
            if (base == 2) {
                bin = 1;
            } else if (base == 10) {
                dec = 1;
            } else if (base == 16) {
                hex = 1;
            }
        }
    }
    if (bin) {
        int_to_string(value, result, 2);
        printf("0b%s\n", result);
    }
    if (dec) {
        int_to_string(value, result, 10);
        printf("%s\n", result);
    }
    if (hex) {
        int_to_string(value, result, 16);
        printf("0x%s\n", result);
    }
}
int main(int argc, char *argv[]) {
    if (argc < 4 || strcmp(argv[2], "-o") != 0) {
        fprintf(stderr, "Usage: %s <value> -o <base> [-o <base> ...]\n", argv[0]);
        return 1;
    }
    uint32_t value = string_to_uint(argv[1]);
    helperfn(value, argc, argv);
}
