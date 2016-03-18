//
//  Horista.h
//  Funcionario
//
//  Created by Danilo Barros Mendes on 3/11/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "Professor.h"

@interface Horista : Professor

@property double valorPorHora;
@property int horasTrabalhadasPorMes;

-(double)calcularSalario;
@end
