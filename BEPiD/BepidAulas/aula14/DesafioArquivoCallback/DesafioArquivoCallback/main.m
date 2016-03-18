//
//  main.m
//  DesafioArquivoCallback
//
//  Created by Danilo Barros Mendes on 3/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLSistema.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        MLSistema *sistema = [[MLSistema alloc] init];
        
        
        
        // Uso do NSTimer
        //[sistema gatilho];
        //NSDate *data = [NSDate date];
        //NSTimeInterval intervalo = 8;
        //[[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeInterval:intervalo sinceDate:data]];
        
        
        /*
         
        [sistema criarQuatroUsuarios:nil];
         
        BOOL result = [sistema gravarDadosNoRepositorioML];
        
        NSData *read;
        
        NSMutableArray *dados = [[NSMutableArray alloc] init];
        
        if (!result) {
            NSLog(@"Nao gravou");
            exit(1);
        }
        
        for (int i=0; i<[[sistema usuarios] count]; i++) {
            read = [NSData dataWithContentsOfFile:[[NSString stringWithFormat:@"~/Desktop/RepositorioML/%@.txt" ,[[sistema usuarios][i] cpf]] stringByStandardizingPath]];
            
            if (read) {
                [dados addObject:read];
            }
            
        }
        
        
        NSNumber *cpfPesquisa = [[NSNumber alloc] init];
        cpfPesquisa = [[sistema usuarios][2] cpf];
        
        for (int i=0; i<[dados count]; i++) {
            
            NSString *string = [[NSString alloc] initWithData:dados[i] encoding:NSUTF8StringEncoding];
            
            if ([string rangeOfString:[NSString stringWithFormat:@"%@",cpfPesquisa]].location != NSNotFound) {
                NSLog(@"Usuario Encontrado!!\n%@",string);
                break;
            }
                
        }
        
        
        
        NSLog(@"%@", [sistema usuarios]);
        
        */
        
        [sistema observer];
        NSLog(@"Esperando...");
        [[NSRunLoop currentRunLoop] run];
        
        
    }
    return 0;
}
