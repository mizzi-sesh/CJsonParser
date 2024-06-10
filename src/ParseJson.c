#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main (int argc, char *argv[ ])
{

  printf("\n");

  if (argc == 1)
  {
    printf("You must include an directory and file path to a valid JSON file as the second argument to the command.\n");
    
    printf("\n");
    return -1;
  }
  
  int i; int j;
  char directory[strlen(argv[1])-1];
  for (i = 1; i < argc; i++){
  
    for( j = 0; j < strlen(argv[i]); j++){ 
      //printf("%c", argv[i][j]);

      if (i == 1){
        memset(directory, '\0', sizeof(directory));
        printf("%s\n", directory);
        strncpy(directory, argv[i], strlen(argv[i]));
        printf("%s\n", directory);
        FILE *fptr;
        fptr = fopen(directory, "r");
        if(fptr){
          while(fgets(directory, strlen(argv[i]), fptr)) {
            printf("%s", directory);
          }
        }
        fclose(fptr);
        return 0;
      }

    }
    printf("\n");

  }
  printf("\n");
  return 0;
}


