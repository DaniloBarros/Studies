//
//  AlunoDAO.m
//  BancoDados
//
//  Created by Danilo Barros Mendes on 7/7/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "AlunoDAO.h"
#import "Usuario.h"

@implementation AlunoDAO


- (instancetype)init
{
    self = [super init];
    if (self) {
        _pathDataBase = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Aluno.sqlite"];
        self.dataBase = [FMDatabase databaseWithPath:self.pathDataBase];
    }
    return self;
}

+(instancetype)sharedInstance{
    
    static dispatch_once_t pred=0;
    static AlunoDAO *_sharedInstance = nil;
    
    dispatch_once(&pred, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    
    return _sharedInstance;
}

-(NSMutableArray*)listaTudo{
    
    NSMutableArray *usuarios = [[NSMutableArray alloc] init];
    
    [self.dataBase open];
    
    FMResultSet *result = [self.dataBase executeQuery:@"SELECT * FROM Usuario"];
    NSLog(@"Error: %@", [self.dataBase lastErrorMessage]);
    //pega o resultado
    while ([result next]) {
        
        NSInteger IdUsuario = [result intForColumn:@"idUsuario"];
        NSString *nome = [result stringForColumn:@"nome"];
        NSString *email = [result stringForColumn:@"email"];
        NSString *senha = [result stringForColumn:@"senha"];
        NSString *situacao = [NSString stringWithFormat:@"%@",[[result stringForColumn:@"situacao"]isEqualToString:@"A"]?@"Ativo":@"Inativo"];
        Usuario *usuario = [[Usuario alloc] initWithDatas:IdUsuario nome:nome emailUsuario:email senhaUsuario:senha situacaoUsuario:situacao];
        
        [usuarios addObject:usuario];
        
    }
    
    [self.dataBase close];
    //NSLog(@"%@\n", usuarios[0]);
    return usuarios;
}

-(void)insertUsuario:(Usuario *) usu{
    
    [self.dataBase open];
    
    [self.dataBase executeUpdate:@"INSERT INTO Usuario (nome, email, senha,situacao) VALUES (?,?,?,?)",
     usu.nome, usu.email, usu.senha, usu.situacao, nil];
    
    NSLog(@"Error: %@", [self.dataBase lastErrorMessage]);
    [self.dataBase close];
     
}


-(void)deleteUsuarioById:(NSInteger)idUser{
    
    [self.dataBase open];
    
    [self.dataBase executeQuery:@"DELETE FROM Usuario WHERE idUsuario = ?", [NSNumber numberWithLong:idUser]];
    
    NSLog(@"%@", [self.dataBase lastErrorMessage]);
    
    [self.dataBase close];
    
}

-(void)buscarUsuarioById:(NSInteger) idUsu{
    
    self.usuarioArray = [[NSMutableArray alloc]init];
    
    //abre o banco de dados
    [self.dataBase open];
    
    //faz select
    FMResultSet *result = [self.dataBase executeQuery:@"SELECT idUsuario, nome, situacao FROM Usuario WHERE idUsuario = ? Order By Nome", [NSNumber numberWithLong:idUsu]];
    
    //pega o resultado
    while ([result next]) {
    
        NSInteger IdUsuario = [result intForColumn:@"idUsuario"];
        NSString *nome = [result stringForColumn:@"nome"];
        NSString *situacao = [NSString stringWithFormat:@"%@",[[result stringForColumn:@"situacao"]isEqualToString:@"A"]?@"Ativo":@"Inativo"];
        Usuario *usuario = [[Usuario alloc]initWithDatas:IdUsuario nome:nome emailUsuario:@"" senhaUsuario:@"" situacaoUsuario:situacao];
        [self.usuarioArray addObject:usuario];
    
    }
    
    [self.dataBase close];
    
 
}


@end
