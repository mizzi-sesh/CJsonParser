#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include "ParseJson.h"


int main (int argc, char *argv[ ])
{

  printf("\n");

  if (argc == 1)
  {
    printf("You must include an directory and file path to a valid JSON file as the second argument to the command.\n");
    return -1;
  }

    int pRet = ParseArgs(argc, argv);
    if (pRet == 0){
    } 
    else {
      return pRet; 
    }
  
  return 0;
}

int ParseArgs(int argc, char *argv[])
{
  int i; int j;
  char directory[strlen(argv[1])];

  for (i = 1; i < argc; i++){
  
    for( j = 0; j < strlen(argv[i]); j++){ 
      //printf("%c", argv[i][j]);

      if (i == 1){
        memset(directory, '\0', sizeof(directory));
        strcpy(directory, argv[i]);
        FILE *fptr;
        fptr = fopen(directory, "r");
        if(fptr){
          int k = 0;
          while(fgets(directory, strlen(argv[i]), fptr)) {
            // printf("%s", directory);  
            if (k == 0 && *directory != '\"'){
            printf("Directory must be enclosed in brackets");
            return -1;
            }
            k++;
          }
          printf("%s", directory);
        }
        else {
          printf("Could not locate or read file provided as argument.\n");
          return -1;
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
