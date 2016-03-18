//
//  Horista.m
//  Funcionario
//
//  Created by Danilo Barros Mendes on 3/11/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "Horista.h"

@implementation Horista


-(double)calcularSalario{
    return self.valorPorHora*self.horasTrabalhadasPorMes;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"Professor <%@> e contratado no sistema [Horista] que ganha R$ <%lf> por mes", self.nome, [self calcularSalario]];
}

@end
