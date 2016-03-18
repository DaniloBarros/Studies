//
//  main.m
//  PrimeiraClasse
//
//  Created by Danilo Barros Mendes on 2/25/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BEPPessoa.h"
#import "BEPiDEmpresa.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        //BEPiDEmpresa *empresa = [[BEPiDEmpresa alloc] init];
        
        //[empresa setFuncionarios:[NSMutableArray array]];
        
        //BEPiDFuncionario *funcionario = [[BEPiDFuncionario alloc] init];
        
        
        //for(int i=0; i<10; i++){
            //[funcionario setNome:[NSString stringWithFormat:@"Funcionario%d", i]];
            //[funcionario setSalario:1000*(i+1)];
            //[funcionario setId:i];
            
            //[empresa adicionarFuncionario:funcionario];
        
            //funcionario = [[BEPiDFuncionario alloc] init];

        //}

        //--------------Desafio 1-4
//        
//        BEPiDEmpresa *empresa = [[BEPiDEmpresa alloc] init];
//        BEPiDCarro *carro = [[BEPiDCarro alloc]init];
//        
//        NSArray *cores = [[NSArray alloc]initWithObjects:@"Amarelo", @"Azul", @"Verde", @"Prata", @"Preto", @"Rosa-Chiclete", nil];
//        NSArray *ano = [[NSArray alloc]initWithObjects:@"2014",@"2013",@"2012",@"1960",@"1094", nil];
//        
//        [empresa setFuncionarios:[NSMutableArray array]];
//        
//        
//        for(int i=0; i<10; i++){
//            [empresa criarFuncionarioNome:[NSString stringWithFormat:@"Funcionario%d", i] eSalario:(1000*(i+1))];
//        
//            carro = [[BEPiDCarro alloc] initWithPlaca:[NSString stringWithFormat:@"J%c%c-%d",65 + arc4random()%(90-65), 65 + arc4random()%(90-65), 1000 + arc4random()%(9999-1000)] eModelo:@"Sedan" eMarca:@"Ford" eCor:cores[arc4random()%6] eAno:ano[arc4random()%5]];
//            
//            [empresa adicionaCarro:carro noIndice:i];
//        }
//        
//        
//        [empresa criarFuncionarioNome:[NSString stringWithFormat:@"Funcionario%d", 10] eSalario:(1000*(10+1))];
//        [empresa adicionaCarro:carro noIndice:10];
//        
//        for (int i=1; i<10; i+=2) {
//            [[empresa funcionarios][i] setSalario:[[empresa funcionarios][i]salario]*1.2];
//        }
//        
//        NSLog(@"\n\n%@\n\n\n", empresa);
//        
//        [[empresa funcionarios][10] aumentarSalario];
//        NSLog(@"%@\n\n",[empresa funcionarios][10]);
//        
//        [[empresa funcionarios][10] aumentarSalario];
//        [[empresa funcionarios][10] aumentarSalario];
//        
//        NSLog(@"%@",[empresa funcionarios][10]);
//        
        /*//Testes
        BEPiDCarro *crash = [[BEPiDCarro alloc]initWithPlaca:carro.placa eModelo:carro.modelo eMarca:carro.marca eCor:carro.cor eAno:carro.ano];
        [empresa adicionaCarro:crash noIndice:10];
        [[empresa funcionarios][10] aumentarSalario];
        [[empresa funcionarios][9] setCargo:@"Assitente"];
        [[empresa funcionarios][9] setCargo:@"Teste"];
        */
        
        //----------Desafio 4
        
        //[empresa presentearFuncionarios];
        
        //NSLog(@"%@",empresa);
        
        //---------Desafio 5
        
        BEPiDEmpresa *empresa = [[BEPiDEmpresa alloc] init];
        BEPiDCarro *carro = [[BEPiDCarro alloc]init];
        
        NSArray *cores = [[NSArray alloc]initWithObjects:@"Amarelo", @"Azul", @"Verde", @"Prata", @"Preto", @"Rosa-Chiclete", nil];
        NSArray *ano = [[NSArray alloc]initWithObjects:@"2014",@"2013",@"2012",@"1960",@"1094", nil];
        
        int salario=330;
        for(int i=0; i<30; i++){
            
            carro = [[BEPiDCarro alloc] initWithPlaca:[NSString stringWithFormat:@"J%c%c-%d",65 + arc4random()%(90-65), 65 + arc4random()%(90-65), 1000 + arc4random()%(9999-1000)] eModelo:@"Sedan" eMarca:@"Ford" eCor:cores[arc4random()%6] eAno:ano[arc4random()%5]];
            
            [empresa criarFuncionarioNome:[NSString stringWithFormat:@"Funcionario%d", i] eSalario:(salario) eCarro:carro];
            
            salario*=1.15;
        }
        NSLog(@"%@", empresa);
        [empresa crise];
        NSLog(@"\n\n\n%@",empresa);
        
        for(int i=0;i<13;i++)
            [empresa calcularGastosMensais];
        NSLog(@"\n\n\n%@",empresa);
        
    }
    return 0;
}
