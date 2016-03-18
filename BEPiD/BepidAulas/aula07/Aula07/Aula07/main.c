//
//  main.c
//  Aula07
//
//  Created by Danilo Barros Mendes on 2/19/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

typedef struct BEPiDFuncionario{
    char *identidade;
    char *nome;
    float salario;
}BEPiDFuncionario;

typedef struct BEPiDEmpresa{
    BEPiDFuncionario *funcionarios;
}BePiDEmpresa;

int main(int argc, const char * argv[]) {
    
    BePiDEmpresa *empresa;
    
    empresa = (BePiDEmpresa *) malloc( sizeof(BePiDEmpresa) );
    
    empresa->funcionarios = (BEPiDFuncionario *) malloc(10*sizeof(BEPiDFuncionario));
    
    for(int i=0; i<10; i++){
        fflush(stdin);
        printf("Cadastre o funcionario %d:\n",i+1 );
        printf("Identidade: ");
        empresa->funcionarios[i].identidade = (char*) malloc(32*sizeof(char));
        gets(empresa->funcionarios[i].identidade);
        
        fflush(stdin);
        printf("Nome: ");
        empresa->funcionarios[i].nome = (char*) malloc(60*sizeof(char));
        gets(empresa->funcionarios[i].nome);
        
        fflush(stdin);
        printf("Salario: ");
        scanf("%f", &empresa->funcionarios[i].salario);
    }
    
    for(int i=0;i<10;i++){
        printf("Funcionario %d:\n\tNome - %s\n\tID - %s\n\tSalario - %.2f\n",i+1, empresa->funcionarios[i].nome, empresa->funcionarios[i].identidade, empresa->funcionarios[i].salario);
    }
    
    return 0;
}
