//
//  main.c
//  Aula03
//
//  Created by Danilo Barros Mendes on 2/10/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void Break(){
    int x=0;
    
    while(1){
        if(x + 90 == x*x)
            break;
        else
            x++;
    }
    
    int y;
    for(y=0; y+90!=y*y; y++);
    
    printf("%d ", x);
    
}

void Continue(){
    int x;
    
    for(x=1; x<100 ;x++){
        if(x%3==0)
            continue;
        
        printf("%d\t",x);
        
    }
}

int par(double x){
    
    return (!((int)x%2));
}

void atkin(){
    int limit;
    int wlimit;
    int i, j, x, y, z;
    unsigned char *sieb;
    
    printf("Insira o limite do intervalo: ");
    scanf("%d", &limit);
    
    sieb = (unsigned char *)malloc(limit*sizeof(unsigned char));
    
    wlimit = sqrt(limit);
    
    for(x=1; x<=wlimit; x++)
    {
        for(y=1; y<=wlimit; y++)
        {
            z = 4*x*x + y*y;
            if(z<=limit && (z%60==1 || z%60==13 || z%60==17 || z%60==29 || z%60==37 || z%60==41 || z%60==49 || z%60==53))
            {
                sieb[z] = !sieb[z];
            }
            z = 3*x*x + y*y;
            if(z<=limit && (z%60==7 || z%60==19 || z%60==31 || z%60==43))
            {
                sieb[z] = !sieb[z];
            }
            z = 3*x*x - y*y;
            if(x>y && z<=limit && (z%60==11 || z%60==23 || z%60==47 || z%60==59))
            {
                sieb[z] = !sieb[z];
            }
        }
    }
    
    for(i=5; i<=wlimit; i++)
    {
        if(sieb[i]==1)
        {
            for(j=1; j * i*i <= limit; j++)
            {
                sieb[j*i*i] = 0;	
            }		
        }
    }
    
    printf("Seguintes primos foram calculados: \n2\n3\n5");
    for(i=5; i<=limit; i++)
    {
        if(sieb[i]==1)
        {
            printf("\n%d", i);
        }
    }
}

int main(int argc, const char * argv[]) {
    
    /*double p;
    
    for(p=2; p<30; p++){
        
        if(par(p)){
            if(p!=2)
                continue;
        }else{
            for(int i=3; i<=sqrt(p); i+=2){
            
                printf("%d ",i);
            
                if((int)p%i==0){
                    continue;
                }
            }
        }
        
        printf("a%0.f\t", p);
    }*/
    
    atkin();
    
    return 0;
}
