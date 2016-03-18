//
//  BEPiDCarro.h
//  PrimeiraClasse
//
//  Created by Danilo Barros Mendes on 2/25/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BEPiDCarro : NSObject
{
    NSString *_marca;
    NSString *_placa;
    NSString *_cor;
    NSString *_modelo;
    NSString *_ano;
}

-(void)setMarca: (NSString *)marca;
-(NSString *)marca;

-(void)setPlaca: (NSString *)placa;
-(NSString *)placa;

-(void)setCor: (NSString *)cor;
-(NSString *)cor;

-(void)setModelo: (NSString *)modelo;
-(NSString *)modelo;

-(void)setAno: (NSString *)ano;
-(NSString *)ano;

-(id)initWithPlaca: (NSString *)placa
           eModelo:(NSString *)modelo
            eMarca:(NSString *)marca
              eCor:(NSString *)cor
              eAno:(NSString *)ano;

@end
