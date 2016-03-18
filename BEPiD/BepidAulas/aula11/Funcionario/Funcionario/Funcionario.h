//
//  Funcionario.h
//  Funcionario
//
//  Created by Danilo Barros Mendes on 3/11/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Funcionario : NSObject

@property (nonatomic) int id;
@property (nonatomic) NSString *departamento;
@property (nonatomic) NSString *nome;

-(BOOL) isProfessor;

@end


