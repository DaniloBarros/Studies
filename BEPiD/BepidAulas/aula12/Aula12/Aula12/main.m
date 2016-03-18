//
//  main.m
//  Aula12
//
//  Created by Danilo Barros Mendes on 3/11/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BEPiDAluno.h"
#import "BEPiDPatrimonio.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *alunos = [[NSMutableArray alloc] init];
        
        for (int i=0; i<10; i++) {
            BEPiDAluno *alunoBEPiD = [[BEPiDAluno alloc] init];
            
            alunoBEPiD.matriculaAluno = i;
            
            [alunos addObject:alunoBEPiD];
            
        }
        
        for (int i=0; i<30; i++) {
            BEPiDPatrimonio *patrimonioBEPiD = [[BEPiDPatrimonio alloc] init];
            
            NSString *patrimonioRotulo = [NSString stringWithFormat:@"MacBook%d",i];
            
            patrimonioBEPiD.rotuloPatrimonio = patrimonioRotulo;
            patrimonioBEPiD.valorRevenda = 350+ i*17;
            
            NSUInteger randomIndice = arc4random()%[alunos count];
            
            BEPiDAluno *alunoRandom = [alunos objectAtIndex:randomIndice];
            
            [alunoRandom adicionarPatrimonio:patrimonioBEPiD];
            
            //NSLog(@"%@", [patrimonioBEPiD dono]);
        }
        NSLog(@"Alunos: %@", alunos);
        NSLog(@"Removendo um Aluno aleatorio");
        [alunos removeObjectAtIndex:arc4random()%[alunos count]];
        NSLog(@"Removendo todo o array");
        alunos = nil;
        
        
    }
    return 0;
}
