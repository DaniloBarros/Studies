//
//  Veiculo.m
//  Aula15Protocol
//
//  Created by Danilo Barros Mendes on 3/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "Veiculo.h"

@implementation Veiculo

- (instancetype)initWithLocomocao:(id)locomocao
                        ePotencia:(id)potencia{
    self = [super init];
    if (self) {
        _locomocao = locomocao;
        _potencia = potencia;
    }
    return self;
}

-(float)andar{
    return [[self locomocao] facilidade]*[[self potencia] forca];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Classe Potencia: %@\rClasse Locomocao: %@\rAndar: %f\r\r", [[self potencia] class], [[self locomocao] class], [self andar]];
}


@end
