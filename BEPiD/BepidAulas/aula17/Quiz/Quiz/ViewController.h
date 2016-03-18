//
//  ViewController.h
//  Quiz
//
//  Created by Danilo Barros Mendes on 3/18/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *perguntas;
@property (nonatomic, copy) NSArray *respostas;

@property (nonatomic, weak) IBOutlet UILabel *perguntaLabel;
@property (nonatomic, weak) IBOutlet UILabel *respostaLabel;



@end
