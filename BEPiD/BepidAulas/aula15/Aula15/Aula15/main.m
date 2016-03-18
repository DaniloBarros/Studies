//
//  main.m
//  Aula15
//
//  Created by Danilo Barros Mendes on 3/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        
        //Crie um bloco que substitua espaços brancos por underscore
        
        NSString* (^trocarEspaco)(NSString*) = ^(NSString * myString){
            
            return [myString stringByReplacingOccurrencesOfString:@" " withString:@"_"];
        };
        
        
        char nom[100], livr[100], film[100];
        puts("Digite seu nome completo: ");
        gets(nom);
        puts("Digite o titulo do seu livro preferido: ");
        gets(livr);
        puts("Digite o titulo do seu filme preferido: ");
        gets(film);
        
        NSString *nome = [[NSString alloc] initWithUTF8String:nom];
        NSString *livro = [[NSString alloc] initWithUTF8String:livr];
        NSString *filme = [[NSString alloc] initWithUTF8String:film];
        
        
        
        NSString *str = [[NSString alloc] initWithFormat:@"%@%@%@", trocarEspaco(nome),trocarEspaco(livro),trocarEspaco(filme)];
        
        NSLog(@"%@",str);
        
        
        
    }
    return 0;
}
