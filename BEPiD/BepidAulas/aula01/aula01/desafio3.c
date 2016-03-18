//
//  desafio3.c
//  aula01
//
//  Created by Danilo Barros Mendes on 2/5/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int main(){
    
    struct Pessoa{
        int idade;
        float massa;
        float altura;
        char sexo;
    } *pessoas, pessoinhas[10];
    
    int baixinhoGordo=0;
    int NPessoas;
    float mediaIdade=0,mascJovem=0;
    
    do{
        puts("Digite o numero, positivo nao nulo, de pessoas a serem cadastradas: ");
        scanf("%d", &NPessoas);
    }while(NPessoas>0);
    
    
    pessoas = (struct Pessoa *) malloc(NPessoas * sizeof(struct Pessoa));
    
    for(int i=0;i<NPessoas;i++){
        
        do{
            printf("Digite a idade da %d pessoa: ", i+1);
            scanf("%d", &pessoas[i].idade);
        }while(pessoas[i].idade < 0 || pessoas[i].idade > 150);
        
        do{
            printf("Digite a massa da %d pessoa: ", i+1);
            scanf("%f", &pessoas[i].massa);
        }while(pessoas[i].massa <= 0);
        
        do{
            printf("Digite a altura da %d pessoa: ", i+1);
            scanf("%f", &pessoas[i].altura);
        }while(pessoas[i].altura <= 0);
        
        do{
            printf("Digite o sexo da %d pessoa (M ou F): ", i+1);
            fflush(stdin);
            scanf(" %c", &pessoas[i].sexo);
            
        }while(pessoas[i].sexo != 'M' && pessoas[i].sexo != 'F');
        
        
        if (pessoas[i].altura < 1.5 && pessoas[i].massa > 90) {
            baixinhoGordo++;
        }
        
        if (pessoas[i].sexo=='M' && (pessoas[i].idade < 30 && pessoas[i].idade > 10) ) {
            mascJovem++;
        }
        
        mediaIdade+=pessoas[i].idade;
        puts("");
    }
    
    printf("Media das idades %0.f\n", mediaIdade/NPessoas);
    printf("Numero de Baixinhos Gordos %d\n", baixinhoGordo);
    printf("Porcentacem de Homens Jovens %f\n", (100 * mascJovem)/NPessoas);
    
    return 0;
}