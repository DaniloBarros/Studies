//
//  ViewController2.h
//  QuizCapitais
//
//  Created by Danilo Barros Mendes on 3/19/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController

@property (nonatomic, weak) NSString *nome;
@property (nonatomic, weak) IBOutlet UILabel *nomeUsuario;

@property (nonatomic) int perguntaIndice;

@property (nonatomic, copy) NSArray *perguntas;
@property (nonatomic, copy) NSArray *capitais;

@property (nonatomic, weak) IBOutlet UILabel *perguntasLabel;
@property (nonatomic, weak) IBOutlet UILabel *capitaisLabel;

@property (nonatomic, weak) IBOutlet UIStepper *pontuacao;
@property (nonatomic) IBOutlet UILabel *pont;

@end
