#include <stdio.h>
#include <string.h>

int main (int argc, char *argv[ ])
{
  int i; int j;

  printf("\n");
  
  for (i = 0; i < argc; i++){
  
    for( j = 0; j < strlen(argv[i]); j++){

      char x = argv[i][j];
    
        //FILE *fptr;
        //printf("%d", argc);
        //printf("%d", arg1_size);
    
      printf("%c", x);
      //fptr = fopen("", "mode");

    }
    printf("\n");

  }
  printf("\n");
  return 0;
}
