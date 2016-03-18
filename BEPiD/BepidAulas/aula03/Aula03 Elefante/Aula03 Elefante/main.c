//
//  main.c
//  Aula03 Elefante
//
//  Created by Danilo Barros Mendes on 2/10/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#include <stdio.h>

void elefantes(int vezes){
    
    if(vezes>=1){
        printf("Incomodam...");
        elefantes(vezes-1);
    }

}

int main(int argc, const char * argv[]) {
    int elef=0,vezes;
    
    scanf("%d",&vezes);
    
    for(elef=1; elef<vezes; elef++){
        
        if(elef==1)
            printf("%d Elefante incomoda muita gente. ", elef);
        else
            printf("%d Elefantes incomodam muita gente. ", elef);
        
        printf("%d Elefantes ",elef+1);
        elefantes(elef+1);
        printf(" Muito Mais.\n");
        
    }
    
    return 0;
}
