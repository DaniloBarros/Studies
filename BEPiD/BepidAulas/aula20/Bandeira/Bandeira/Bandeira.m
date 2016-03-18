//
//  Bandeira.m
//  Bandeira
//
//  Created by Danilo Barros Mendes on 3/26/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "Bandeira.h"

@interface Bandeira()

@end

@implementation Bandeira


-(void)viewDidLoad{
    [super viewDidLoad];
    
    //Japao
    /*
    UIWindow *tela = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    float width = tela.bounds.size.width;
    float height = floor(tela.bounds.size.width/(3.0/2.0));
    float x = 0;
    float y = (tela.bounds.size.height/2.0)-height/2.0;
    
    _fundo = CGRectMake(x, y, width, height);
    
    _rect = [[Retangulo alloc] initWithFrame:_fundo eCor:[UIColor blackColor]];
    _rect.backgroundColor = [UIColor whiteColor];
    
    _fundo = CGRectMake(width/2.0-(height/1.5)/2.0, height/2.0-(height/1.5)/2.0, height/1.5, height/1.5);
    
    _elip = [[Elipse alloc] initWithFrame:_fundo eCor:[UIColor redColor]];
    _elip.backgroundColor = [UIColor clearColor];
    [_rect addSubview:_elip];

    [self.view addSubview:_rect];
    [self.view layoutSubviews];
    */
    
    //Franca
    /*
    UIWindow *tela = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    float width = tela.bounds.size.width;
    float height = floor(tela.bounds.size.width/(3.0/2.0));
    float x = 0;
    float y = (tela.bounds.size.height/2.0)-height/2.0;
    
    _fundo = CGRectMake(x, y, width, height);
    
    _rect = [[Retangulo alloc] initWithFrame:_fundo eCor:[UIColor blackColor]];
    _rect.backgroundColor = [UIColor whiteColor];
    
    Retangulo *azul = [[Retangulo alloc] initWithFrame:CGRectMake(0, 0, width/3.0, height) eCor:[UIColor blueColor]];
    
    
    Retangulo *vermelho = [[Retangulo alloc] initWithFrame:CGRectMake((width/3.0)*2, 0, width/3.0, height) eCor:[UIColor redColor]];
    
    [_rect addSubview:azul];
    [_rect addSubview:vermelho];
    
    [self.view addSubview:_rect];
    [self.view layoutSubviews];
    */
    
    //Suica
    UIWindow *tela = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    float width = tela.bounds.size.width;
    float height = floor(tela.bounds.size.width/(3.0/2.0));
    float x = 0;
    float y = (tela.bounds.size.height/2.0)-height/2.0;
    
    _fundo = CGRectMake(x, y, width, height);
    
    _rect = [[Retangulo alloc] initWithFrame:_fundo eCor:[UIColor redColor]];
    
    
    Retangulo *branco = [[Retangulo alloc] initWithFrame:CGRectMake(0, 0, width/2.5, height/5) eCor:[UIColor whiteColor]];
    
    
}

@end
