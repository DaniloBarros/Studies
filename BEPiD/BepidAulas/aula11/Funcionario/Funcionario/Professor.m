//
//  Professor.m
//  Funcionario
//
//  Created by Danilo Barros Mendes on 3/11/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "Professor.h"

@implementation Professor

-(BOOL) isProfessor{
    
    [super isProfessor];
    
    NSLog(@"Logico que e professor");
    return YES;
}

-(NSString*)description{
    return [NSString stringWithFormat:@"Professor <%@> e contratado no sistema [Generico]", self.nome];
}

@end
