//
//  BEPPessoa.h
//  PrimeiraClasse
//
//  Created by Danilo Barros Mendes on 2/25/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BEPPessoa : NSObject

{
    //Declarando três variaveis protected
    // _ precede o nome das variaveis de classe
    NSString *_nome;
    float _altura;
    int _peso;
    
}

//Assinatura dos metodos acessores (Get Set)
//Get por convenção não tem o get no nome
-(void)setNome: (NSString *)nome;
-(NSString *)nome;

-(void)setAltura: (float)altura;
-(float)altura;

-(void)setPeso: (int)peso;
-(int)peso;

//Assinatura do metodo que calcula imc
-(float)massaCorporal;

@end
