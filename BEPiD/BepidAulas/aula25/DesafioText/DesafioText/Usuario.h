//
//  Usuario.h
//  DesafioText
//
//  Created by Danilo Barros Mendes on 5/28/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Usuario : NSObject <NSCoding>

@property (nonatomic) NSString *nome;
@property (nonatomic) NSString *cpf;
@property (nonatomic) NSString *telefone;
@property (nonatomic) NSString *senha;
@property (nonatomic) NSDate *dataCadastro;

-(instancetype)initWithNome:(NSString*)nome
                        cpf:(NSString*)cpf
                   telefone:(NSString*)telefone
                      senha:(NSString*)senha
               dataCadastro:(NSDate*)data;

@end
