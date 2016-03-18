//
//  main.c
//  Aula05Heap
//
//  Created by Danilo Barros Mendes on 2/12/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char *email;
    char *telefone;
    float *notas;
}Aluno;

int main(int argc, const char * argv[]) {

    Aluno *aluno = (Aluno *)malloc(sizeof(Aluno));
    int n;
    
    printf("Digite o email do aluno: ");
    aluno->email = (char *) malloc(sizeof(char)*500);
    fflush(stdin);
    gets(aluno->email);
    
    printf("Digite o telefone do aluno: ");
    aluno->telefone = (char *) malloc(sizeof(char)*50);
    fflush(stdin);
    gets(aluno->telefone);
    
    printf("Digite o numero de notas para cadastrar: ");
    scanf("%d", &n);
    
    aluno->notas = (float *) malloc(sizeof(int)*n);
    
    puts("");
    
    float media=0;
    
    for(int i=0; i<n; i++){
        printf("%d nota: ",i+1);
        scanf("%f", &aluno->notas[i]);
        media+=aluno->notas[i];
    }
    
    printf("Telefone: %s\nEmail: %s\nMedia das notas %f\n", aluno->telefone, aluno->email, media/n);
    
    free(aluno);
    aluno=NULL;
    
    return 0;
}
