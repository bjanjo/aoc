#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int is_abba(const char* line) {
    int between_brackets = 0;
    int len = strlen(line);
    int found = 0;
    for(int i = 0; i < len -3; i++) {
        if (!between_brackets && line[i] == line[i+3] && line[i+1] == line[i+2] && line[i] != line[i+1]) {
            printf("abba found at %d ", i);
            found = 1;
        }
        if (between_brackets && line[i] == ']') {
            //printf("] at %d ", i);
            between_brackets = 0;
        }
        if(line[i] == '[') {
            //printf("[ at %d ", i);
            between_brackets = 1;
        }
        if (between_brackets && line[i] == line[i+3] && line[i+1] == line[i+2] && line[i] != line[i+1]) {
            printf("abba in squares at %d} ", i);
            return 0;
        }
    }
    return found;
}
//iapqmjgrjnecxylopbo[pnbvgmbhbcmcnpsf]opurzpqoyxdxfkud
int main(int argc, char** argv)
{
    FILE * fp;
    char * line = NULL;
    size_t len = 0;
    ssize_t read;

    fp = fopen(argv[1], "r");
    if (fp == NULL)
        exit(EXIT_FAILURE);
    int count = 0;
    while ((read = getline(&line, &len, fp)) != -1) {
        if(is_abba(line)) {
            printf("Found tls %s", line);
            count++;
        }
    }
    printf("Found %d tls ip\n", count);
    fclose(fp);
    if (line)
        free(line);
    exit(EXIT_SUCCESS);
}
