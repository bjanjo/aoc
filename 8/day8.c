#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define WIDTH 50 
#define HEIGHT 6

void rect(const int x, const int y, int mat[][HEIGHT]) {
    printf("rect %dx%d\n", x,y);
    for(int i=0; i < x; i++) {
        for(int j=0; j < y; j++) {
            mat[i][j] = 1;
        }
    }
}

void rot_row(int mat[][HEIGHT], const int row, const int by) {
    printf("rotate row y=%d by %d\n", row, by);
    int new_row[WIDTH];
    memset(new_row, 0, sizeof(int)*WIDTH);
    for(int i=0; i < WIDTH; i++) {
        if (mat[row][i] == 1)  {
            printf("Rot row: setting %d,%d to 1\n", row, (by+(by-1)));

            new_row[by+(by-i)] = 1;
        }
    }
    for(int i=0;i<WIDTH;i++) {
        mat[row][i] = new_row[i];
    }
}

void rot_col(int mat[][HEIGHT], const int col, const int by) {
    printf("rotate column x=%d by %d\n", col, by);
    int new_col[HEIGHT];
    memset(new_col, 0, sizeof(int)*HEIGHT);

    for(int i=0; i < HEIGHT; i++) {
        if (mat[i][col] == 1)  {
            printf("Rot col: setting %d,%d to 1\n", (by+(by-1)), col);
            new_col[by+(by-i)] = 1;
        }
    }

    for(int i=0;i<HEIGHT;i++) {
        mat[i][HEIGHT] = new_col[i];
    }
}

void print_matrix(int mat[][HEIGHT]) {
    //printf("Matrix:\n");
    for(int i = 0; i<HEIGHT;i++) {
        for (int j=0;j<WIDTH;j++) {
            if (mat[j][i] == 1) {
                printf("#");
            } else {
                printf(".");
            }
        }
        printf("\n");
    }
}

int main(int argc, char** argv)
{
    int matrix[WIDTH][HEIGHT];
    memset(matrix, 0, sizeof(matrix[0][0]) * WIDTH * HEIGHT);
    matrix[0][0] = 1;
    matrix[2][0] = 1;
    print_matrix(matrix);
    rect(3,2,matrix);
    print_matrix(matrix);
    rot_col(matrix, 1, 1);
    print_matrix(matrix);
    rot_row(matrix, 0, 4);
    print_matrix(matrix);


    /*
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
       */
    exit(EXIT_SUCCESS);
}
