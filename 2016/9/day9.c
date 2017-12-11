#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main(int argc, void** argv) {
    const char* file_name = (const char*) argv[1];
    printf("Open file %s\n",file_name);

    FILE *f = fopen(file_name, "rb"); //open as binary to be portable
    fseek(f, 0, SEEK_END);
    long fsize = ftell(f);
    rewind(f);

    printf("Reading %ld bytes from %s\n", fsize, file_name);
    char *buf = malloc(fsize + 1);
    fread(buf, fsize, 1, f);
    fclose(f);
    buf[fsize] = 0;
    return 0;
}
