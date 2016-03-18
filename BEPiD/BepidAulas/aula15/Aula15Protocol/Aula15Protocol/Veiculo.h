//
//  Veiculo.h
//  Aula15Protocol
//
//  Created by Danilo Barros Mendes on 3/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Locomocao.h"
#import "Potencia.h"
@interface Veiculo : NSObject 

@property (nonatomic) id<Locomocao> locomocao;
@property (nonatomic) id<Potencia> potencia;

-(float)andar;

- (instancetype)initWithLocomocao:(id)locomocao
                        ePotencia:(id)potencia;

@end
