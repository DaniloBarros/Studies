//
//  MLSistema.h
//  DesafioArquivoCallback
//
//  Created by Danilo Barros Mendes on 3/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLUsuario.h"

@interface MLSistema : NSObject

@property (nonatomic) NSMutableArray *usuarios;
@property (nonatomic) NSTimer *time;

-(void)observer;
-(void) gatilho;
-(void)criarQuatroUsuarios:(NSTimer*)time;
-(BOOL)gravarDadosNoRepositorioML;


@end
