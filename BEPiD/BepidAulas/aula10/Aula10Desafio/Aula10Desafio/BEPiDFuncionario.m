//
//  BEPiDFuncionario.m
//  PrimeiraClasse
//
//  Created by Danilo Barros Mendes on 2/25/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "BEPiDFuncionario.h"

@implementation BEPiDFuncionario

-(void)setCarro:(BEPiDCarro*)carro{
    _carro = carro;
}

-(BEPiDCarro *)carro{
    return _carro;
}

-(void)setId:(int)iD{
    _id = iD;
}

-(int)iD{
    return _id;
}

-(void)setNome:(NSString *)nome{
    _nome = [[NSString alloc] initWithString:nome];
}

-(NSString *)nome{
    return [[NSString alloc]initWithString:_nome];
}

-(void)setSalario:(float)salario{
    
    if(salario<20000 && salario > 100)
        _salario = salario;
    else
        NSLog(@"Error, salario fora do intervalo valido");
}

-(float)salario{
    return _salario;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"Id %d, Nome %@, Salario %.2f", _id, _nome, _salario];
}




@end