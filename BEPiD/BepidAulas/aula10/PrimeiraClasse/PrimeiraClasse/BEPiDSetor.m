//
//  BEPiDSetor.m
//  PrimeiraClasse
//
//  Created by Danilo Barros Mendes on 3/3/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "BEPiDSetor.h"

@implementation BEPiDSetor

-(id)initWithBEPiDSetor: (BEPiDSetor *)setor{
    
    self = [super init];
    
    if(self){
        if([setor nome]!=nil)
            [self setNome:[setor nome]];
        else
            [self setNome:[[NSString alloc]init]];
        
        if([setor funcionarios]!=nil)
            [self setFuncionarios:[setor funcionarios]];
        else
            [self setFuncionarios:[[NSMutableArray alloc]init] ];
        
        [self setId:[setor Id]];
    }
    
    return self;
}

-(id)initWithID:(int)Id
          eNome:(NSString *)nome
  eFuncionarios:(NSMutableArray *)funcionarios{
    
    self = [super init];
    
    if(self){
        
        [self setId:Id];
        [self setNome:nome];
        [self setFuncionarios:funcionarios];
        
    }
    
    return self;
}

-(void)setId:(int)ID{
    _id = ID;
}
-(int)Id{
    return _id;
}

-(void)setNome:(NSString *)nome{
    _nome = [[NSString alloc] initWithString:nome];
}
-(NSString *)nome{
    return [[NSString alloc] initWithString:_nome];
}

-(void)setFuncionarios:(NSMutableArray *)funcionarios{
    _funcionarios = [[NSMutableArray alloc]initWithArray:funcionarios];
}
-(NSMutableArray *)funcionarios{
    return [[NSMutableArray alloc]initWithArray:_funcionarios];
}

-(NSMutableArray *)funcionariosReal{//Criado pela falta de Tempo, ta feio pra carai
    return _funcionarios;
}

-(int)numeroDeFuncionariosSetor: (NSString *)cargo{
    int cont=0;
    for(int i=0; i<[[self funcionarios]count]; i++){
        if([[[self funcionarios][i] cargo]isEqualToString:cargo]){
            cont++;
        }
    }
    return cont;
}

-(void)adicionarFuncionario:(BEPiDFuncionario *)funcionario{
    
    if (funcionario!=nil) {
        
        [_funcionarios addObject:funcionario];
        //NSLog(@"Funcionario %@ Adicionado com sucesso no setor %@", funcionario, [self nome]);
    }else
        NSLog(@"Funcionario invalido");
    
}

-(BEPiDFuncionario *)menorSalario:(NSString*)cargo{
    BEPiDFuncionario* func = [[BEPiDFuncionario alloc] init];
    float salario = 19999.99999999999;
    [func setSalario:salario];
    
    for (int i=0; i<[[self funcionarios] count]; i++) {
        if([func salario] > [[self funcionarios][i] salario]){
            func = [self funcionarios][i];
        }
    }
    
    return func;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"Setor: %@ ID: %d \r\rFuncionarios:%@\r\r", [self nome], [self Id],[self funcionarios]==nil?@"SEM FUNCIONARIOS":_funcionarios];
}

@end
