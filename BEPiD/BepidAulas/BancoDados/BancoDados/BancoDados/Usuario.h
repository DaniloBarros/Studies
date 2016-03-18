//
//  Usuario.h
//  BancoDados
//
//  Created by Danilo Barros Mendes on 7/7/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Usuario : NSObject

@property (nonatomic) NSInteger idUsuario;
@property (nonatomic) NSString *nome;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *senha;
@property (nonatomic) NSString *situacao;


- (instancetype)initWithDatas: (NSInteger)idUsuario
                         nome:(NSString*)nome
                 emailUsuario:(NSString*)email
                 senhaUsuario:(NSString*)senha
              situacaoUsuario:(NSString*)situacao;

@end
