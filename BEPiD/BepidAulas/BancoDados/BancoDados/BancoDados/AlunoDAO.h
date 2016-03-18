//
//  AlunoDAO.h
//  BancoDados
//
//  Created by Danilo Barros Mendes on 7/7/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB/FMDatabase.h"
#import "Usuario.h"

@interface AlunoDAO : NSObject

@property (strong, nonatomic) NSString *pathDataBase;
@property (strong, nonatomic) FMDatabase *dataBase;
@property (strong, nonatomic) NSMutableArray *usuarioArray;

-(void)insertUsuario:(Usuario *) usu;
-(void)buscarUsuarioById:(NSInteger) idUsu;
+(instancetype)sharedInstance;
-(NSMutableArray*)listaTudo;
-(void)deleteUsuarioById:(NSInteger)idUser;

@end
