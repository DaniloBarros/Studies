//
//  BEPiDFuncionario.m
//  PrimeiraClasse
//
//  Created by Danilo Barros Mendes on 2/25/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "BEPiDFuncionario.h"

@implementation BEPiDFuncionario

-(void)setCarro:(NSMutableArray*)carro{
    
    for(int i=0; i<[carro count]; i++){
        if([[carro[i] className] isNotEqualTo:@"BEPiDCarro"]){
            NSLog(@"Array para setCarro invalido");
            return ;
        }
    }
    
    _carro = carro;
}

-(NSMutableArray *)carro{
    return _carro;
}

-(void)criarCarroPlaca:(NSString *)placa eModelo:(NSString *)modelo eMarca:(NSString *)marca eCor:(NSString *)cor eAno:(NSString *)ano{
    
    BEPiDCarro *car = [[BEPiDCarro alloc]init];
    
    [car setPlaca:placa];
    [car setModelo:modelo];
    [car setMarca:marca];
    [car setCor:cor];
    [car setAno:ano];
    
    if([self carro]==nil){
        [self setCarro:[[NSMutableArray alloc]init]];
        [[self carro]addObject:car];
    }else{
        [[self carro]addObject:car];
    }
    
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
    
    if(salario<20000 && salario > 100){
        
        _salario = salario;
        
        _cargo = [self determinaCargo:salario];
        
    }else
        NSLog(@"Error, salario fora do intervalo valido");
}

-(float)salario{
    return _salario;
}

-(void)setCargo:(NSString *)cargo{
    NSArray *cargos = [[NSArray alloc]initWithObjects:@"Estagiario", @"Assistente", @"Chefe de Setor", @"Gerente", @"Presidente", @"Herdeiro" ,nil];
    
    if ([cargos containsObject:cargo] && cargo == [self determinaCargo:_salario]) {
        _cargo = cargo;
    
    }else{
        NSLog(@"Cargo Invalido");
    }
}

-(NSString *)cargo{
    return _cargo==nil?[[NSString alloc]init] :[[NSString alloc]initWithString:_cargo];
}

-(NSString *)determinaCargo:(float)salario{
    
    if(salario<800){
        return @"Estagiario";
    }else if(salario<2000.01){
        return @"Assistente";
    }else if(salario<5000.01){
        return @"Chefe de Setor";
    }else if(salario<10000.01){
        return @"Gerente";
    }else if(salario<15000.01){
        return @"Presidente";
    }else{
        return @"Herdeiro";
    }
}

-(void)aumentarSalario{
    
    [self setSalario:(_salario * 1.2)];
    
}

-(NSString *)description{
    return [NSString stringWithFormat:@"Id %d, Nome '%@', Salario %.2f, Cargo '%@'\rCarros \r%@\r", _id, _nome, _salario, _cargo, _carro!=nil?_carro:@"Esse anda de onibus"];
}




@end
