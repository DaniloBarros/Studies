//
//  BEPiDSetor.h
//  PrimeiraClasse
//
//  Created by Danilo Barros Mendes on 3/3/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BEPiDFuncionario.h"

@interface BEPiDSetor : NSObject

{
    int _id;
    NSString *_nome;
    NSMutableArray *_funcionarios;
    
}

-(id)initWithBEPiDSetor: (BEPiDSetor *)setor;

-(id)initWithID:(int)Id
          eNome:(NSString *)nome
  eFuncionarios:(NSMutableArray *)funcionarios;


-(void)setId:(int)ID;
-(int)Id;

-(void)setNome:(NSString *)nome;
-(NSString *)nome;

-(void)setFuncionarios:(NSMutableArray *)funcionarios;
-(NSMutableArray *)funcionarios;

-(NSMutableArray *)funcionariosReal;

-(int)numeroDeFuncionariosSetor: (NSString *)cargo;

-(void)adicionarFuncionario:(BEPiDFuncionario *)funcionario;

-(BEPiDFuncionario *)menorSalario:(NSString*)cargo;

@end
