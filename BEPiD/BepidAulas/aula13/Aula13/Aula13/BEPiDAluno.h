//
//  BEPiDAluno.h
//  Aula13
//
//  Created by Danilo Barros Mendes on 3/12/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BEPiDAluno : NSObject

@property (nonatomic) NSString *nome;
@property (nonatomic) NSDate *dataNascimento;
@property (nonatomic, readonly) NSNumber *idade;
@property (nonatomic) NSString *universidade;
@property (nonatomic) NSString *curso;
@property (nonatomic) NSDate *dataEntrada;
@property (nonatomic,readonly) NSNumber *semestreAtual;

- (instancetype)initWithNome:(NSString*)nome
                 eNascimento:(NSDate*)nascimento
               eUniversidade:(NSString *)universidade
                      eCurso:(NSString *)curso
                    eEntrada:(NSDate*)entrada;

@end
