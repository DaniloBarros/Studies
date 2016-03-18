//
//  BEPiDCarro.m
//  PrimeiraClasse
//
//  Created by Danilo Barros Mendes on 2/25/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "BEPiDCarro.h"

@implementation BEPiDCarro

-(void) setMarca:(NSString *)marca{
    _marca = [[NSString alloc]initWithString:marca];
}
-(NSString *)marca{
    return [[NSString alloc]initWithString:_marca];
}

-(void) setPlaca:(NSString *)placa{
    _placa = [[NSString alloc]initWithString:placa];
}
-(NSString *)placa{
    return [[NSString alloc]initWithString:_placa];
}

-(void) setCor:(NSString *)cor{
    _cor = [[NSString alloc]initWithString:cor];
}
-(NSString *)cor{
    return [[NSString alloc]initWithString:_cor];
}

-(void) setModelo:(NSString *)modelo{
    _modelo = [[NSString alloc]initWithString:modelo];
}
-(NSString *)modelo{
    return [[NSString alloc]initWithString:_modelo];
}

-(void) setAno:(NSString *)ano{
    _ano = ano;
}
-(NSString *)ano{
    return _ano;
}

-(id)initWithPlaca: (NSString *)placa
           eModelo:(NSString *)modelo
            eMarca:(NSString *)marca
              eCor:(NSString *)cor
              eAno:(NSString *)ano{
    
    self = [super init];
    if(self){
        [self setPlaca:placa];
        [self setModelo:modelo];
        [self setMarca:marca];
        [self setCor:cor];
        [self setAno:ano];

    }
    
    return self;
}

-(NSString *)description{
    NSString *var = [[NSString alloc] initWithFormat:@"Placa '%@' - Marca '%@' - Cor '%@' - Modelo '%@' - Ano %@\r", _placa, _marca, _cor, _modelo,_ano];;
    return var;
}

@end
