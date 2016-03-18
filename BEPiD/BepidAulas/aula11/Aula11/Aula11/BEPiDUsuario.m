//
//  BEPiDUsuario.m
//  Aula11
//
//  Created by Danilo Barros Mendes on 3/10/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "BEPiDUsuario.h"

@implementation BEPiDUsuario

-(id)init{
    
    self = [super init];
    
    if(self){
        _dataCriacao = [[NSDate alloc]init];
        _dataCriacao = [NSDate date];
    }
    
    return self;
}

-(id)initWithNome:(NSString*)nome
            eData:(NSString
                   *)data
         eUsuario:(NSString*)usuario
           eSenha:(NSString*)senha{
    
    self = [super init];
    
    if(self){
        _dataCriacao = [[NSDate alloc]init];
        _dataCriacao = [NSDate date];
        
        [self setNome:nome];
        [self setNascimento:data];
        [self setUsuario:usuario];
        [self setSenha:senha];
        
    }
    
    return self;
}

-(void)setSenha:(NSString *)senha{
    _senha = [senha stringByPaddingToLength:15 withString:@"criptografado" startingAtIndex:3];
    
}

-(NSString*)description{
    return [NSString stringWithFormat:@"Nome: %@ Data de Nascimento: %@ Usuario: %@ Senha: %@ Data de Criacao: %@\r",self.nome, self.nascimento, self.usuario, self.senha, self.dataCriacao];
}

@end
