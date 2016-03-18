//
//  DetailView.h
//  BancoDados
//
//  Created by Danilo Barros Mendes on 7/14/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailView : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *iD;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *senha;
@property (weak, nonatomic) IBOutlet UILabel *status;

@property (nonatomic) NSInteger userId;
@property (nonatomic) NSString *userEmail;
@property (nonatomic) NSString *userNome;
@property (nonatomic) NSString *userSenha;
@property (nonatomic) NSString *userStatus;

@end
