//
//  BEPiDGastos.h
//  PrimeiraClasse
//
//  Created by Danilo Barros Mendes on 3/6/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BEPiDGastos : NSObject

{
    int _ano;
    NSMutableArray *_gastoMensal;
    float _gastoAnual;
}

-(void)setAno:(int)ano;
-(int)anoAtual;

-(void)setGastoMensal:(NSMutableArray *)gastoMensal;
-(NSMutableArray *)gastoMensal;

-(void)setGastoAnual:(float)gastoAnual;
-(float)gastoAnual;

-(BOOL)adicionarGastoMensal:(float)gasto;

-(NSUInteger)mes;

-(void)calcularGastoAnual;

@end
