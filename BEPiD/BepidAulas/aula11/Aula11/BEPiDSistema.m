//
//  BEPiDSistema.m
//  Aula11
//
//  Created by Danilo Barros Mendes on 3/10/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "BEPiDSistema.h"

@implementation BEPiDSistema

-(void)adicionarUsuario:(BEPiDUsuario*)usuario{
    
    if(self.usuarios == nil)
        [self setUsuarios:[[NSMutableArray alloc] init]];
    
    [[self usuarios]addObject:usuario];
}

-(NSString*)description{
    return [NSString stringWithFormat:@"%@",_usuarios];
}

@end
