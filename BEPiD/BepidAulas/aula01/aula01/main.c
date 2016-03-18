//
//  main.c
//  aula01
//
//  Created by Danilo Barros Mendes on 2/5/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[]) {
    
    //Primeiro desafio
    
    int tamanhoTelaNotebook;
    int tamanhoSuportadoMochila = 16;
    
    puts("Digite o tamanho da tela");
    scanf("%d", &tamanhoTelaNotebook);
    
    if(tamanhoTelaNotebook < tamanhoSuportadoMochila){
        puts("It fits o/");
    
    }else{
        puts("Have a good walk home with this monster in your hands");
    }
    
    
    //Segundo desafio
    
    int iOSVersion;
    puts("Digite a versao iOS");
    scanf("%d", &iOSVersion);
    
    switch (iOSVersion) {
        case 1:
            puts("1.1.5");
            break;
        case 2:
            puts("2.2.1");
            break;
        case 3:
            puts("3.2.2");
            break;
        case 4:
            puts("4.3.5");
            break;
        case 5:
            puts("5.1.1");
            break;
        case 6:
            puts("6.1.6");
            break;
        case 7:
            puts("7.1.2");
            break;
        case 8:
            puts("8.2 Beta 5");
            break;
        default:
            puts("No version found");
            break;
    }
    
    return 0;
}
