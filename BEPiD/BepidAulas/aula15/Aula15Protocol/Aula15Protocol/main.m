//
//  main.m
//  Aula15Protocol
//
//  Created by Danilo Barros Mendes on 3/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Veiculo.h"
#import "Rodas.h"
#import "Asas.h"
#import "Pernas.h"
#import "Motor.h"
#import "Turbina.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Asas *asa = [[Asas alloc] init];
        Rodas *roda = [[Rodas alloc] init];
        Pernas *pernas = [[Pernas alloc] init];
        Motor *motor = [[Motor alloc] init];
        Turbina *turbina = [[Turbina alloc] init];
        
        Veiculo *aviao = [[Veiculo alloc] initWithLocomocao:asa ePotencia:turbina];
        Veiculo *carro = [[Veiculo alloc] initWithLocomocao:roda ePotencia:motor];
        Veiculo *velotrol = [[Veiculo alloc] initWithLocomocao:roda ePotencia:pernas];
        
        NSLog(@"Aviao %@\nCarro %@\nVelotrol %@",aviao,carro,velotrol);
        
    }
    return 0;
}
