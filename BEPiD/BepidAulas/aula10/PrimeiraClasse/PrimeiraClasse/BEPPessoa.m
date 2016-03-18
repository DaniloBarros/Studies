//
//  BEPPessoa.m
//  PrimeiraClasse
//
//  Created by Danilo Barros Mendes on 2/25/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "BEPPessoa.h"

@implementation BEPPessoa

-(void)setNome:(NSString *)nome{
    _nome = [[NSString alloc]initWithString:nome];
}

-(NSString *)nome{
    return [[NSString alloc]initWithString:_nome];
}

-(void)setAltura:(float)altura{
    _altura = altura;
}

-(float)altura{
    return _altura;
}

-(void)setPeso:(int)peso{
    _peso = peso;
}

-(int)peso{
    return _peso;
}

-(float)massaCorporal{
    
    return [self peso]/(self.altura*self.altura);
}

@end
