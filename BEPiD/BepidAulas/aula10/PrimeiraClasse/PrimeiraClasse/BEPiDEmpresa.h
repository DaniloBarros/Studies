//
//  BEPiDEmpresa.h
//  PrimeiraClasse
//
//  Created by Danilo Barros Mendes on 2/25/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BEPiDSetor.h"
#import "BEPiDGastos.h"

@interface BEPiDEmpresa : NSObject
{
    int _contador;
    int _anoAtual;
    
    NSArray *_setores;
    
    NSMutableArray* _gastosAnuais;
    
}

-(void)setSetores:(NSArray *)setores;
-(NSArray *)setores;

-(void)setGastosAnuais:(NSMutableArray *)gastos;
-(NSMutableArray *)gastosAnuais;

-(BOOL)menor: (int)menor
      eFunc2:(int)func2
      eFunc3:(int)func3;

-(void)adicionarFuncionario: (BEPiDFuncionario *)funcionario;
-(void) criarFuncionarioNome: (NSString *)nome
                    eSalario: (float)salario;

-(void) criarFuncionarioNome: (NSString *)nome
                    eSalario: (float)salario
                      eCarro:(BEPiDCarro *)carro;


-(int)numeroDeFuncionarios: (NSString *)cargo;

-(BOOL)verificaCarros: (BEPiDCarro *)carro;

-(void)adicionaCarro:(BEPiDCarro  *)carro
             noSetor:(int)setor
            noIndice:(int)indice;

-(void)presentearFuncionarios;

-(void)aumentaSalarioImpares;

-(void)crise;

-(void)atualizarAno;

-(void)calcularGastosMensais;

@end
