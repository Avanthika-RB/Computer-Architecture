#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <stdbool.h>
#include <string.h>

bool is_dec_digit(char c) {
    return isdigit(c);
}

bool is_bin_digit(char c) {
    return c == '0' || c == '1';
}

bool is_hex_digit(char c) {
    c = tolower(c);
    return isdigit(c) || (c >= 'a' && c <= 'f');
}

bool is_dec_str(char *s) {
    for (int i = 0; s[i]; i++) {
        if (!isdigit(s[i])) {
            return false;
        }
    }
    return true;
}

bool is_bin_str(char *s) {
    for (int i = 0; s[i]; i++) {
        if (s[i] != '0' && s[i] != '1') {
            return false;
        }
    }
    return true;
}

bool is_hex_str(char *s) {
    while (*s) {
        char c = tolower(*s);
        if (!isdigit(c) && (c < 'a' || c > 'f')) {
            return false;
        }
        s++;
    }
    return true;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: numinfo <value>\n");
        return 1;
    }

    char *input = argv[1];
    bool is_int = is_dec_str(input);
    bool is_bin = is_bin_str(input);
    bool is_hex = is_hex_str(input);

    printf("int: %s\n", is_int ? "true" : "false");
    printf("bin: %s\n", is_bin ? "true" : "false");
    printf("hex: %s\n", is_hex ? "true" : "false");

    return 0;
}
