//
//  MLUsuario.h
//  DesafioArquivoCallback
//
//  Created by Danilo Barros Mendes on 3/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLPessoa.h"

@interface MLUsuario : MLPessoa

//NSString nome
//NSNumber cpf
@property (nonatomic) NSString *email;
@property (nonatomic) NSData *foto;
@property (nonatomic) NSString *caracteristicas;


- (instancetype)initWithNome: (NSString*) nome
                        eCpf:(NSNumber*)cpf
                      eEmail:(NSString*)email
                       eFoto:(NSData*)foto
            eCaracteristicas:(NSString*)caracteristicas;

//-(BOOL)writeToFile:(NSString*)path atomically:(BOOL)atomically;

@end
