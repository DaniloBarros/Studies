//
//  main.m
//  Aula11
//
//  Created by Danilo Barros Mendes on 3/10/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BEPiDSistema.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BEPiDSistema *sistema = [[BEPiDSistema alloc] init];
        BEPiDUsuario *usuario = [[BEPiDUsuario alloc] init];
        
        for(int i=0;i<20;i++){
            usuario = [[BEPiDUsuario alloc] initWithNome:[NSString stringWithFormat:@"Usuario-%d",i+1] eData:[NSString stringWithFormat:@"%d/%d/%d",arc4random()%28,arc4random()%12,1900+arc4random()%2014-1900]  eUsuario:[NSString stringWithFormat:@"Usuario%d",i] eSenha:[NSString stringWithFormat:@"Senha%d",i]];
            
            [sistema adicionarUsuario:usuario];
            //NSLog(@"sleep%d",i);
            //sleep(5);
        }
        
        NSLog(@"%@",sistema);
        
    }
    return 0;
}
