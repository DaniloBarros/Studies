//
//  main.m
//  Aula14
//
//  Created by Danilo Barros Mendes on 3/13/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString *str = [[NSMutableString alloc] init];
        
        for (int i=0; i<10; i++) {
            [str appendString:@"Eu sou cool!\n"];
        }
        
        NSError *error;
        
        BOOL result = [str writeToFile:@"/tmp/cool.txt"
              atomically:YES
                encoding:NSUTF8StringEncoding
                   error:&error];
        
        NSLog(@"Escrevendo arquivo /tmp/cool.txt %@", [error localizedDescription]);
        NSString *strA;
        if(result)
            strA = [[NSString alloc] initWithContentsOfFile:@"/tmp/cool.txt"
                                                         encoding:NSUTF8StringEncoding
                                                            error:&error];
        
        if(!strA)
            NSLog(@"Falhou: %@", [error localizedDescription]);
        else
            NSLog(@"Pegou os dados: %@", strA);
        
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"http://www.mclopes.com.br/Images/logo.png"]];
        
        if (!imageData) {
            NSLog(@"Nao baixou");
            exit(1);
        }
        
        BOOL resultImg = [imageData writeToFile:[@"~/Desktop/logo.png" stringByStandardizingPath] atomically:YES];
        
        if (resultImg) {
            NSLog(@"Gravou a imagem");
        }else
            NSLog(@"Nao gravou");
        
        NSData *read = [NSData dataWithContentsOfFile:[@"~/Desktop/logo.png" stringByStandardizingPath]];
        
        NSLog(@"O arquivo lido tem %lu bytes", (unsigned long)[read length]);
        
    }
    return 0;
}
