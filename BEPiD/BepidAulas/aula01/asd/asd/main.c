//
//  main.c
//  asd
//
//  Created by Danilo Barros Mendes on 3/10/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    int tamanhoTelaNotebook;
    int tamanhoSuportadoMochila = 16;
    
    puts("Digite o tamanho da tela");
    scanf("%d", &tamanhoTelaNotebook);
    
    if(tamanhoTelaNotebook < tamanhoSuportadoMochila){
        puts("It fits o/");
        
    }else{
        puts("Have a good walk home with this monster in your hands");
    }
    return 0;

}
