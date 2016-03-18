//
//  Usuario.m
//  DesafioText
//
//  Created by Danilo Barros Mendes on 5/28/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "Usuario.h"

@implementation Usuario

#define kNome @"nome"
#define kCpf @"cpf"
#define kTelefone @"telefone"
#define kSenha @"senha"
#define kData @"data"

-(instancetype)initWithNome:(NSString*)nome
                        cpf:(NSString*)cpf
                   telefone:(NSString*)telefone
                      senha:(NSString*)senha
               dataCadastro:(NSDate*)data{
    
    if (self = [super init]) {
        
        _nome = nome;
        _cpf = cpf;
        _telefone = telefone;
        _senha = senha;
        _dataCadastro = data;
        
    }
    
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    NSString *nome = [aDecoder decodeObjectForKey:kNome];
    NSString *cpf = [aDecoder decodeObjectForKey:kCpf];
    NSString *telefone = [aDecoder decodeObjectForKey:kTelefone];
    NSString *senha = [aDecoder decodeObjectForKey:kSenha];
    NSDate *data = [aDecoder decodeObjectForKey:kData];
    
    return [self initWithNome:nome cpf:cpf telefone:telefone senha:senha dataCadastro:data];
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_nome forKey:kNome];
    [aCoder encodeObject:_cpf forKey:kCpf];
    [aCoder encodeObject:_telefone forKey:kTelefone];
    [aCoder encodeObject:_senha forKey:kSenha];
    [aCoder encodeObject:_dataCadastro forKey:kData];
}

@end
