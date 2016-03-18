//
//  main.c
//  Aula07Genealogica
//
//  Created by Danilo Barros Mendes on 2/19/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

typedef struct Pessoa{
    char *nome;
    char *dataNascimento;
    struct Pessoa *mae;
    struct Pessoa *pai;
    struct Pessoa *conjuge;
    struct Pessoa *filhos;
    
    int numFilhos;
    
}Pessoa;

void Inicializar(Pessoa *avo){
    
    Pessoa *aux = (Pessoa *)malloc(sizeof(Pessoa));
    
    //Avó
    avo->nome = (char*) malloc(sizeof(char)*50);
    avo->nome = "Francisca Barros";
    avo->dataNascimento = (char*) malloc(sizeof(char)*15);
    avo->dataNascimento = "?????????";
    
    avo->mae = NULL;
    avo->pai = NULL;
    avo->numFilhos = 2;
    
        //Avô
        aux->mae = NULL;
        aux->pai = NULL;
        aux->nome = (char*) malloc(sizeof(char)*50);
        aux->nome = "Joao Barros";
        aux->dataNascimento = (char*) malloc(sizeof(char)*50);
        aux->dataNascimento = "?????????";
        aux->numFilhos = 2;
    
        aux->conjuge = avo;
    
        //TODO filho
    
    avo->conjuge = aux;
    
    //Mae e tia
    avo->filhos = (Pessoa *)malloc(sizeof(Pessoa)*2);
    avo->filhos[0].mae = avo->filhos[1].mae = avo;
    avo->filhos[0].pai = avo->filhos[1].pai = aux;
    
    avo->filhos[0].nome = avo->filhos[1].nome = (char*) malloc(sizeof(char)*50);
    avo->filhos[0].dataNascimento = avo->filhos[1].dataNascimento = (char*) malloc(sizeof(char)*50);
    
    //Mae
    avo->filhos[0].nome = "Gislandia Barros";
    avo->filhos[0].dataNascimento = "18/10/1966";
    avo->filhos[0].numFilhos = 2;
    
        //Pai
        aux = (Pessoa *)malloc(sizeof(Pessoa));
        aux->nome = (char*) malloc(sizeof(char)*50);
        aux->dataNascimento = (char*) malloc(sizeof(char)*50);
        aux->mae = NULL;
        aux->pai = NULL;
        aux->nome = "Adir Fernandes";
        aux->dataNascimento = "21/04/1967";
        aux->conjuge = &avo->filhos[0];
        aux->numFilhos = 2;
        //TODO Filhos
    
    avo->filhos[0].conjuge = aux;
    
    avo->filhos[0].filhos = (Pessoa*)malloc(sizeof(Pessoa)*2);
    
        //Eu
        aux = (Pessoa *)malloc(sizeof(Pessoa));
        aux->nome = (char*) malloc(sizeof(char)*50);
        aux->dataNascimento = (char*) malloc(sizeof(char)*50);
        aux->nome = "Danilo Barros";
        aux->dataNascimento = "12/07/1995";
        aux->pai = avo->filhos[0].conjuge;
        aux->mae = &avo->filhos[0];
        aux->conjuge = NULL;
        aux->filhos = NULL;
        aux->numFilhos = 0;
    
    avo->filhos[0].filhos[0] = *aux;
    
        //Irma
        aux = (Pessoa *)malloc(sizeof(Pessoa));
        aux->nome = (char*) malloc(sizeof(char)*50);
        aux->dataNascimento = (char*) malloc(sizeof(char)*50);
        aux->nome = "Larissa Barros";
        aux->dataNascimento = "30/06/2000";
        aux->pai = avo->filhos[0].conjuge;
        aux->mae = &avo->filhos[0];
        aux->conjuge = NULL;
        aux->filhos = NULL;
        aux->numFilhos = 0;
    
    avo->filhos[0].filhos[1] = *aux;
    
    //Tia
    avo->filhos[1].nome="Fatima Barros";
    avo->filhos[1].dataNascimento="????????";
    avo->filhos[1].numFilhos = 1;
    
    avo->filhos[1].conjuge=NULL;
    
    avo->filhos[1].filhos = (Pessoa *)malloc(sizeof(Pessoa));
    
        //Primo
        aux = (Pessoa *)malloc(sizeof(Pessoa));
        aux->nome = (char*) malloc(sizeof(char)*50);
        aux->dataNascimento = (char*) malloc(sizeof(char)*50);
        aux->nome = "Frederico Barros";
        aux->dataNascimento = "?????????";
        aux->pai = avo->filhos[1].conjuge;
        aux->mae = &avo->filhos[1];
        aux->conjuge = NULL;
        aux->filhos = NULL;
        aux->numFilhos = 0;
    
    avo->filhos[1].filhos[0] = *aux;
    
    //Filhos Pai
    avo->filhos[0].conjuge->filhos = avo->filhos[0].filhos;
    
    //Filhos Avô
    avo->conjuge->filhos = avo->filhos;
    
    //Atualizando
    
    avo->filhos[0].filhos[0].pai = avo->filhos[0].filhos[1].pai = avo->filhos[0].conjuge;
    avo->filhos[0].pai = avo->filhos[1].pai = avo->conjuge;
    
}


Pessoa *percorrer(Pessoa *pessoa,int direcao){
    
    if(direcao == 0){
        
        if(pessoa->mae!=NULL)
            return pessoa->mae;
        else
            printf("\n\tERRO: Topo da arvore alcancado.\n");
        
        return pessoa;
    
    }else if(direcao>0 && direcao<=pessoa->numFilhos){
        return &pessoa->filhos[direcao-1];
  
    }else{
        printf("\n%s\n",direcao==42?"Tchau":"Opcao invalida");
        return pessoa;
    }
}

void ImprimirDados(Pessoa *pessoa){
    printf("\n%s ",pessoa->nome);
    printf("Nasceu em %s.", pessoa->dataNascimento);
    printf(" Casado(a) com %s. ",pessoa->conjuge==NULL?"Ninguem":pessoa->conjuge->nome);
    if(pessoa->conjuge!=NULL)
        printf("Nasceu em %s.", pessoa->conjuge->dataNascimento);
    printf("\n%s tem ", pessoa->nome);
    printf("%d filhos\n", pessoa->numFilhos);
    
    for(int i=0; i < pessoa->numFilhos;i++){
        printf("\tFilho %d: %s, ", i+1 , pessoa->filhos[i].nome);
        printf("nascido em %s\n", pessoa->filhos[i].dataNascimento);
    }
    
    printf("Selecione uma opcao, 0 subir um nivel%s\n", pessoa->numFilhos==0?".":" ou o numero do filho desejado.");
}

int main(int argc, const char * argv[]) {
    
    Pessoa *avo = (Pessoa *)malloc(sizeof(Pessoa));
    Inicializar(avo);
    
    Pessoa *aux = avo;
    int op;
    
    do{
        puts("\n--------------------------------------------------------");
        ImprimirDados(aux);
        printf("Opcao 42 para terminar o programa: ");
        scanf("%d", &op);
        aux = percorrer(aux, op);
    }while(op!=42);
    
    return 0;
}
