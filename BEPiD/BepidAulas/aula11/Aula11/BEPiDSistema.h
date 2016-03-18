//
//  BEPiDSistema.h
//  Aula11
//
//  Created by Danilo Barros Mendes on 3/10/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BEPiDUsuario.h"
@interface BEPiDSistema : NSObject

@property NSMutableArray* usuarios;

-(void)adicionarUsuario:(BEPiDUsuario*)usuario;

@end
