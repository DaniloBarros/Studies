//
//  BEPiDUsuario.h
//  Aula11
//
//  Created by Danilo Barros Mendes on 3/10/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BEPiDUsuario : NSObject

@property (weak) NSString* nome;

@property (setter=setNascimento:, getter=nascimento)  NSString* dataNascimento;

@property (copy) NSString* usuario;

@property (nonatomic) NSString* senha;

@property (readonly) NSDate* dataCriacao;

-(id)initWithNome:(NSString*)nome
            eData:(NSString*)data
         eUsuario:(NSString*)usuario
           eSenha:(NSString*)senha;

@end
