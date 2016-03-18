//
//  Pessoa.m
//  init
//
//  Created by Danilo Barros Mendes on 3/12/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "Pessoa.h"

@implementation Pessoa

-(id)init{
    self = [super init];
    if(self){
        _dataCriacao = [NSDate date];
    }
    
    return self;
}

-(instancetype)initWithName:(NSString *)name{
    self = [self init];
    if(self){
        _nome = name;
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Nome %@ Data %@", _nome, self.dataCriacao];
}

@end
