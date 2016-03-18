//
//  BEPiDFuncionario.h
//  PrimeiraClasse
//
//  Created by Danilo Barros Mendes on 2/25/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BEPiDCarro.h"

@interface BEPiDFuncionario : NSObject
{
    NSMutableArray *_carro;
    int _id;
    NSString *_nome;
    float _salario;
    NSString *_cargo;
}

-(void)setCarro: (NSMutableArray *)carro;
-(NSMutableArray *)carro;
-(void)criarCarroPlaca: (NSString *)placa
          eModelo:(NSString *)modelo
           eMarca:(NSString *)marca
             eCor:(NSString *)cor
             eAno:(NSString *)ano;

-(void)setId: (int)iD;
-(int)iD;

-(void)setNome:(NSString *)nome;
-(NSString *)nome;

-(void)setSalario:(float)salario;
-(float)salario;

-(void)setCargo:(NSString *)cargo;
-(NSString *)cargo;

-(NSString *)determinaCargo:(float)salario;

-(void)aumentarSalario;

@end
