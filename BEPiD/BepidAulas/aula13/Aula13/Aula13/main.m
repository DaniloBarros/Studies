//
//  main.m
//  Aula13
//
//  Created by Danilo Barros Mendes on 3/12/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHCSVParser.h"
#import "BEPiDAluno.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *meuPath = @"~/Documents/BepidAulas/aula13/Aula13/Aula13/DesafioBEPID.csv";
        
        //Assumi que você iria descompactar diretamente na pasta downloads
        NSString *path = @"~/Downloads/Aula13/Aula13/DesafioBEPID.csv";
        
        //NSLog(@"%@",[path stringByStandardizingPath]);
        
        NSArray *listaAlunos = [NSArray arrayWithContentsOfCSVURL:[NSURL fileURLWithPath:[meuPath stringByStandardizingPath] ]];
        
        if (!listaAlunos || [listaAlunos count]==0) {
            //Alguma coisa deu errado
            NSLog(@"error parsing file");
            exit(1);
        }
        
        //NSLog(@"%@", listaAlunos);
        
        NSMutableDictionary *BEPiD2015 = [[NSMutableDictionary alloc] init];
        
        NSDateFormatter *f = [[NSDateFormatter alloc] init];
        [f setDateFormat:@"dd/MM/yyyy"];
        
        NSMutableSet *alunos = [[NSMutableSet alloc] init];

        
        for (int i=0; i<[listaAlunos count]-1; i++) {
            
            if([listaAlunos[i][0] isEqual:@""])
                continue;
                
            NSDate *nascimento = [f dateFromString:listaAlunos[i][2]];
            
            NSDate *entrada = [f dateFromString:listaAlunos[i][3]];
            
            if(!entrada){
                NSLog(@"Data de entrada do %@ ta nula", listaAlunos[i][0]);
                entrada = [f dateFromString:@"01/01/2000"];
            }
            
            
            if(!nascimento){
                NSLog(@"Data de nascimento do %@ ta nula", listaAlunos[i][0]);
                nascimento = [f dateFromString:@"01/01/2000"];
            }
            
            BEPiDAluno *aluno1 = [[BEPiDAluno alloc] initWithNome:listaAlunos[i][0] eNascimento:nascimento eUniversidade:listaAlunos[i][1] eCurso:listaAlunos[i][5] eEntrada:entrada];
                
            [alunos addObject:aluno1];
            
            
            if([listaAlunos[i+1][4] isNotEqualTo:listaAlunos[i][4]]){
                
                if(alunos)
                    [BEPiD2015 setObject:alunos forKey:listaAlunos[i][4]];
                
                alunos=[[NSMutableSet alloc] init];
                
            }else if(i+2==[listaAlunos count]){
                
                nascimento = [f dateFromString:listaAlunos[i+1][2]];
                
                entrada = [f dateFromString:listaAlunos[i+1][3]];
                
                if(!entrada){
                    NSLog(@"Data de entrada do %@ ta nula", listaAlunos[i][0]);
                    entrada = [f dateFromString:@"01/01/2000"];
                }
                
                if(!nascimento){
                    NSLog(@"Data de nascimento do %@ ta nula", listaAlunos[i][0]);
                    nascimento = [f dateFromString:@"01/01/2000"];
                }
                
                BEPiDAluno *aluno1 = [[BEPiDAluno alloc] initWithNome:listaAlunos[i+1][0] eNascimento:nascimento eUniversidade:listaAlunos[i+1][1] eCurso:listaAlunos[i+1][5] eEntrada:entrada];
                
                [alunos addObject:aluno1];
                
                [BEPiD2015 setObject:alunos forKey:listaAlunos[i+1][4]];
            }
            
            
        }
        
        
        NSLog(@"%@",BEPiD2015);
        
    }
    return 0;
}
