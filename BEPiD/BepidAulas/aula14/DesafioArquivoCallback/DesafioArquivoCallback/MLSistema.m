//
//  MLSistema.m
//  DesafioArquivoCallback
//
//  Created by Danilo Barros Mendes on 3/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "MLSistema.h"

@implementation MLSistema

- (instancetype)init
{
    self = [super init];
    if (self) {
        _usuarios = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)observer{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(criarQuatroUsuarios:)
                                                 name:NSSystemTimeZoneDidChangeNotification
                                               object:nil];
}

-(void)gatilho{
    
    _time = [[NSTimer alloc] init];
    _time = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(criarQuatroUsuarios: )
                                           userInfo:nil
                                            repeats:YES];
    
}


-(void)criarQuatroUsuarios:(NSTimer*) time{
    
    MLUsuario *usuario = [[MLUsuario alloc] initWithNome:@"Yeltsin Suares" eCpf:[NSNumber numberWithLong:3725085175] eEmail:@"yeltsin.suares@gmail.com"  eFoto:[[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://fbcdn-sphotos-g-a.akamaihd.net/hphotos-ak-xap1/v/t1.0-9/1382261_240057382815520_994553784_n.jpg?oh=adaa317fc20b37a01a4bb2c861d7ae38&oe=55839DE0&__gda__=1434818659_75f00986b30a9cb0931b8ceedfdc3a16"]] eCaracteristicas:@"Caracteristica1"];
    
    MLUsuario *usuario2 = [[MLUsuario alloc] initWithNome:@"Andre Franca" eCpf:[NSNumber numberWithLong:30636660101] eEmail:@"andrewf992@gmail.com"  eFoto:[[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"https://fbcdn-sphotos-a-a.akamaihd.net/hphotos-ak-xpf1/t31.0-8/1531883_695688217118852_1397969369_o.jpg"]] eCaracteristicas:@"Caracteristica3"];
    
    MLUsuario *usuario3 = [[MLUsuario alloc] initWithNome:@"Andre Bedran" eCpf:[NSNumber numberWithLong:50016595100] eEmail:@"affbedran@gmail.com"  eFoto:[[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://fbcdn-sphotos-d-a.akamaihd.net/hphotos-ak-xfp1/v/t1.0-9/11081095_880357755339152_6480074585616440489_n.jpg?oh=49d76ab29a51470d391296e43a4eaa9f&oe=5582A2C7&__gda__=1437830222_5acf37f3f569e33e476eac0d8f0a5102"]] eCaracteristicas:@"Caracteristica2"];
    
    
    MLUsuario *usuario4 = [[MLUsuario alloc] initWithNome:@"Bruno Amorim" eCpf:[NSNumber numberWithLong:10282375113] eEmail:@"amorim.software@gmail.com"  eFoto:[[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://scontent-gru.xx.fbcdn.net/hphotos-xpf1/v/t1.0-9/1795781_717055694992436_1652592966_n.jpg?oh=1c7e69a184a6cfd060ed7d7fea9a40a9&oe=55BE2364"]] eCaracteristicas:@"Caracteristica4"];
    
    [[self usuarios] addObject:usuario];
    [[self usuarios] addObject:usuario2];
    [[self usuarios] addObject:usuario3];
    [[self usuarios] addObject:usuario4];
    
    NSLog(@"Usuarios adicionados!");

}

-(BOOL)gravarDadosNoRepositorioML{
    BOOL result=YES, result2=NO, result3=YES;

    //NSString *path = [@"~/Desktop/RepositorioML/DadosCompletos.plist" stringByStandardizingPath];
    
    //result = [_usuarios writeToFile:path atomically:YES];
    
    NSError *error;
    
    for (MLUsuario *user in _usuarios) {
        
        NSString *cpf = [[NSString alloc] initWithFormat:@"%ld",[[user cpf] longValue]];
        
        if (!cpf) {
            break;
        }
        NSString *path = [[NSString alloc] init];
        
        path = [[NSString stringWithFormat:@"~/Desktop/RepositorioML/%@.txt" ,cpf]stringByStandardizingPath];
        
        NSString *dados = [user description];
        
        result2 = [dados writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];
        
        if(!result2){
            return NO;
        }
    }
    
    for (int i=0; i<[[self usuarios] count]; i++) {
        result3 = [[[self usuarios][i] foto] writeToFile:[[NSString stringWithFormat:@"~/Desktop/RepositorioML/%@.png" ,[[self usuarios][i] cpf]]stringByStandardizingPath] atomically:YES];
        
        if(!result3){
            return NO;
        }
    }
    
    return result && result2 && result3;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
