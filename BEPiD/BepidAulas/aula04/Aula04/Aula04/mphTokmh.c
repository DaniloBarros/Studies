//
//  mphTokmh.c
//  Aula04
//
//  Created by Danilo Barros Mendes on 2/11/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#include <stdio.h>


double mphTokmh(double *mph){
    double frc;
    int inteira;
    *mph *= 1.609344;
    
    inteira = (int) *mph;
    
    frc = *mph - inteira;
    
    return frc;
}

int main(){
    
    double mph = 88, fracao;
    
    fracao = mphTokmh(&mph);
    
    printf("%lf %lf", mph, fracao);
    
}