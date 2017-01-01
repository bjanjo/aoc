#include <stdio.h>


int main(int argc, char **argv) {
    const char* filename = argv[1];
    printf("Filename = %s\n", filename);
    FILE* f = fopen(filename, "r");
    char *a;
    char *b;
    char *c;
    int tot = 0;
    while (fscanf(f, "%s\n", a) != EOF) {
        printf("Read a=%s, b=%s, c=%s\n",a,b,c);
        tot++;
    }
    
    printf("Read %d dataz.\n", tot);
    
    fclose(f);
    return 0;
}
