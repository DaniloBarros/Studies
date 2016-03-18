//
//  main.c
//  Aula04-desafio2
//
//  Created by Danilo Barros Mendes on 2/11/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#include <stdio.h>
#include <math.h>

int main(int argc, const char * argv[]) {
    
    int n;
    do{
        printf("Forneca numero de nos da arvore: ");
        scanf("%d", &n);
        if(n%2==0)
            puts("Numero par, digite um numero valido.");
    }while(n%2==0);
    
    int vtr[n]/*[15]={3,2,4,5,4,2,8,7,1,4,6,9,1,2,4}*/, NosPorAltura=1, altura=0, index=0;
    
    altura = sqrt(n);
    
    for(int i=0; i<=altura; i++, NosPorAltura*=2){
        
        for(int j=0 ;j<NosPorAltura;j++, index++){
            printf("Forneca o numero do no %d na altura %d: ",index+1 , i);
            scanf("%d", &vtr[index]);
        }
    }
    
    for(int i=0, index=0, aux=1, NosPorAltura=2; i<altura; i++){
        if(vtr[index+aux] < vtr[index+aux+1]){
            NosPorAltura*=2;
            aux=NosPorAltura;
            puts("Esquerda");
        }else{
            NosPorAltura*=2;
            aux=(NosPorAltura) + 1;
            puts("Direita");
        }
    }
    
    return 0;
}
