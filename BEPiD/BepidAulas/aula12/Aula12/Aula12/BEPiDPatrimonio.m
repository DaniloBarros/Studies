//
//  BEPiDPatrimonio.m
//  Aula12
//
//  Created by Danilo Barros Mendes on 3/11/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "BEPiDPatrimonio.h"
#import "BEPiDAluno.h"

@implementation BEPiDPatrimonio



-(NSString*)description{
    return [NSString stringWithFormat:@"<%@: %u>",self.rotuloPatrimonio, self.valorRevenda];
}

-(void)dealloc{
    NSLog(@"Desalocando: %@", self);
}
@end
