//
//  Usuario.m
//  BancoDados
//
//  Created by Danilo Barros Mendes on 7/7/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "Usuario.h"

@implementation Usuario

- (instancetype)initWithDatas: (NSInteger)idUsuario nome:(NSString*)nome emailUsuario:(NSString*)email senhaUsuario:(NSString*)senha situacaoUsuario:(NSString*)situacao
{
    self = [super init];
    if (self) {
        self.idUsuario = idUsuario;
        self.nome = nome;
        self.email = email;
        self.senha = senha;
        self.situacao = situacao;
    }
    return self;
}
   
@end
