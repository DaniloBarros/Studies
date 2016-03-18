//
//  BEPiDAluno.m
//  Aula13
//
//  Created by Danilo Barros Mendes on 3/12/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "BEPiDAluno.h"

@implementation BEPiDAluno

- (instancetype)initWithNome:(NSString *)nome eNascimento:(NSDate *)nascimento eUniversidade:(NSString *)universidade eCurso:(NSString *)curso eEntrada:(NSDate *)entrada
{
    self = [super init];
    if (self) {
        _nome = nome;
        _dataNascimento = nascimento;
        _universidade = universidade;
        _curso = curso;
        _dataEntrada = entrada;
        
        
        NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        
        NSDate *atual = [NSDate date];
        
        NSDateComponents *comp = [gregorianCalendar components:NSCalendarUnitYear
                                                      fromDate:atual
                                                        toDate:nascimento
                                                       options:0];
        NSInteger year = [comp year]*-1;
        
       _idade =  [[NSNumber alloc] initWithInteger:year];
        
        comp = [gregorianCalendar components:NSCalendarUnitYear
                                    fromDate:atual
                                      toDate:entrada
                                     options:0];
        
        NSInteger sem = [comp year]*-1;
        
        _semestreAtual = [[NSNumber alloc] initWithInteger:(sem*2)];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ - %@", self.nome, self.universidade];
}

@end
