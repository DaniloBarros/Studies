//
//  MLUsuario.m
//  DesafioArquivoCallback
//
//  Created by Danilo Barros Mendes on 3/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "MLUsuario.h"

@implementation MLUsuario

- (instancetype)initWithNome: (NSString*) nome
                        eCpf:(NSNumber*)cpf
                      eEmail:(NSString*)email
                       eFoto:(NSData*)foto
            eCaracteristicas:(NSString*)caracteristicas{
    
    self = [super init];
    if (self) {
        [self setNome:nome];
        [self setCpf:cpf];
        self.email = email;
        _foto = foto;
        _caracteristicas = caracteristicas;
        
    }
    
    return self;
}

/*-(BOOL)writeToFile:(NSString*)path atomically:(BOOL)atomically;{
    
    BOOL result = [self writeToFile:path atomically:YES];
    
    return result;
}*/

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@\n%@\n%@\n%@", [self nome], [self cpf], [self email], [self caracteristicas]];
}

@end
