#include <stdio.h>


int main(int argc, char **argv) {
    const char* filename = argv[1];
    printf("Filename = %s\n", filename);
    FILE* f = fopen(filename, "r");
    int a=0, b=0,c=0;
    int tot = 0; 
    int itr = 0;
    while (fscanf(f, "%d %d %d", &a, &b, &c) != EOF) {
        //printf("Read a=%d, b=%d, c=%d",a,b,c);
        if (a+b>c && a+c>b && b+c>a) {
          //  printf("  a+b=%d>%d, a+c=%d>%d, b+c=%d>%d\n",a+b,c,a+c,b,b+c,a);
            itr++;
        } else {
//            printf("\n");
        }
        tot++;
    }
    
    printf("Read %d dataz. Found %d impossible triangles\n", tot, itr);
    
    fclose(f);
    return 0;
}
