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
    BEPiDCarro *_carro;
    int _id;
    NSString *_nome;
    float _salario;
}

-(void)setCarro: (BEPiDCarro *)carro;
-(BEPiDCarro *)carro;

-(void)setId: (int)iD;
-(int)iD;

-(void)setNome:(NSString *)nome;
-(NSString *)nome;

-(void)setSalario:(float)salario;
-(float)salario;


@end