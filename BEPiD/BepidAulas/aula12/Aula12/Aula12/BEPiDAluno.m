//
//  BEPiDAluno.m
//  Aula12
//
//  Created by Danilo Barros Mendes on 3/11/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "BEPiDAluno.h"
#import "BEPiDPatrimonio.h"

@interface BEPiDAluno(){
    NSMutableArray *_patrimonio;
}
@end


@implementation BEPiDAluno

-(NSMutableArray*) patrimonio{
    return [_patrimonio copy];
}

-(void)setPatrimonio:(NSMutableArray*)p{
    _patrimonio = [p mutableCopy];
}

-(void)adicionarPatrimonio:(BEPiDPatrimonio*)p{
    if(!_patrimonio){
        _patrimonio = [[NSMutableArray alloc] init];
    }
    
    [p setDono:self];
    
    [_patrimonio addObject:p];
}

-(unsigned int)totalPatrimonio{
    unsigned int soma=0;
    for (BEPiDPatrimonio *p in _patrimonio) {
        soma += [p valorRevenda];
    }
    
    return soma;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"Aluno%u possui %u em patrimonio", self.matriculaAluno, self.totalPatrimonio];
}


-(void)dealloc{
    NSLog(@"Desalocando: %@", self);
}
@end
