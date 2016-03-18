//
//  Regime.m
//  Funcionario
//
//  Created by Danilo Barros Mendes on 3/11/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "Regime.h"

@implementation Regime


-(NSString *)description{
    return [NSString stringWithFormat:@"Professor <%@> e contratado no sistema [Regime] que ganha R$ <%lf> por mes", self.nome, self.salario];
}

@end
