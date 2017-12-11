#include <stdio.h>

int is_triangle(int a, int b, int c) {
    return a+b>c && a+c>b && b+c>a;
}

int main(int argc, char **argv) {
    const char* filename = argv[1];
    printf("Filename = %s\n", filename);
    FILE* f = fopen(filename, "r");
    int a1=0, b1=0,c1=0;
    int a2=0, b2=0,c2=0;
    int a3=0, b3=0,c3=0;
    int tot = 0; 
    int itr = 0;
    while (fscanf(f, "%d %d %d\n%d %d %d\n%d %d %d", &a1, &b1, &c1, &a2, &b2, &c2,&a3, &b3, &c3) != EOF) {
        printf("Read a=%d, b=%d, c=%d\n",a2,b2,c2);
        if (is_triangle(a1,a2,a3)) itr++;
        if (is_triangle(b1,b2,b3)) itr++;
        if (is_triangle(c1,c2,c3)) itr++;
          //  printf("  a+b=%d>%d, a+c=%d>%d, b+c=%d>%d\n",a+b,c,a+c,b,b+c,a);
        tot++;
    }
    
    printf("Read %d dataz. Found %d impossible triangles\n", tot, itr);
    
    fclose(f);
    return 0;
}
