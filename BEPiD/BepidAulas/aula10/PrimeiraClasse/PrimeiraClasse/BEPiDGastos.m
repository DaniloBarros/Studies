//
//  BEPiDGastos.m
//  PrimeiraClasse
//
//  Created by Danilo Barros Mendes on 3/6/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "BEPiDGastos.h"

@implementation BEPiDGastos

-(id)init{
    
    self = [super init];
    
    if(self){
        _gastoMensal = [[NSMutableArray alloc] init];
        
    }
    
    return self;
}

-(void)setAno:(int)ano{
    _ano = ano;
}
-(int)anoAtual{
    return _ano;
}

-(void)setGastoAnual:(float)gastoAnual{
    _gastoAnual = gastoAnual;
}
-(float)gastoAnual{
    return _gastoAnual;
}

-(void)setGastoMensal:(NSMutableArray *)gastoMensal{
    _gastoMensal = gastoMensal;
}
-(NSMutableArray *)gastoMensal{
    return _gastoMensal;
}

-(BOOL)adicionarGastoMensal:(float)gasto{
    if([self mes]<12){
        [_gastoMensal addObject:[[NSString alloc] initWithFormat:@"%.2f",gasto]];
        return true;
    }else{
        NSLog(@"12 meses ja preenchidos");
        return false;
    }
}

-(NSUInteger)mes{
    return [_gastoMensal count];
}

-(void)calcularGastoAnual{
    float anual=0;
    
    for (int i=0; i<[_gastoMensal count]; i++) {
        anual+=[_gastoMensal[i] floatValue];
    }
    
    [self setGastoAnual:anual];
}

-(NSString *)description{
    return [NSString stringWithFormat:@"Ano %d - Gasto mensal %@ Gasto anual %.2f",_ano, _gastoMensal,_gastoAnual];
}


@end
