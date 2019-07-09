// basic interpretator

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

int main () {
    system ("/bin/stty raw");
    puts ("BASIC\r");
    // input command
    char s [65536];
    int c;
    while ((c  = getchar()) != 'q') {
	putchar(c);
	if (c == '\r') putchar('\n');
    }
    system ("/bin/stty cooked");
    return 0;
}