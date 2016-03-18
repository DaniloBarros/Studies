//
//  DetailView.m
//  BancoDados
//
//  Created by Danilo Barros Mendes on 7/14/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "DetailView.h"
#import "AlunoDAO.h"

@implementation DetailView

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.iD.text = [NSString stringWithFormat:@"%ld",self.userId];
    self.email.text = self.userEmail;
    self.nome.text = self.userNome;
    self.senha.text = self.userSenha;
    self.status.text = self.userStatus;
    
}

- (IBAction)detele:(UIButton *)sender {
    
    [[AlunoDAO sharedInstance] deleteUsuarioById:self.userId];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
