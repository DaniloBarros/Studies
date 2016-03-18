//
//  main.m
//  Funcionario
//
//  Created by Danilo Barros Mendes on 3/10/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Regime.h"
#import "Horista.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Horista *profH = [[Horista alloc] init];
        [profH setNome:@"Prof Horista"];
        [profH setId:0];
        [profH setDepartamento:@"DP"];
        [profH setDisciplina:@"Matematica"];
        [profH setValorPorHora:15];
        [profH setHorasTrabalhadasPorMes:200];
        
        
        Regime *profR = [[Regime alloc] init];
        [profR setNome:@"Prof Regime"];
        [profR setId:1];
        [profR setDepartamento:@"DP"];
        [profR setDisciplina:@"Fisica"];
        [profR setSalario:3500.87];
        
        Professor *prof = [[Professor alloc] init];
        [prof setNome:@"Professor"];
        [prof setId:2];
        [prof setDepartamento:@"DP"];
        [prof setDisciplina:@"Geografia"];
        
        NSLog(@"%@ %@ %@",profH, profR, prof);
        
        
        
    }
    return 0;
}
