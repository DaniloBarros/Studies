//
//  ViewController.m
//  Quiz
//
//  Created by Danilo Barros Mendes on 3/18/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"


@interface ViewController ()

@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.perguntas = @[@"Do que é feito o pneu?",
                       @"O andré é chato?",
                       @"Qual é a resposta para a pergunta fundamental da Vida, Universo e tudo mais?"];
    
    self.respostas = @[@"Borracha",
                       @"Lógico ou claro?",
                       @"42"];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mostrarPergunta:(id)sender {
    self.currentQuestionIndex++;
    
    if (self.currentQuestionIndex == [self.perguntas count]) {
        self.currentQuestionIndex = 0;
    }
    
    NSString *pergunta = self.perguntas[self.currentQuestionIndex];
    
    self.perguntaLabel.text = pergunta;
    self.respostaLabel.text = @"????";
    
}

- (IBAction)mostraResposta:(id)sender {
    
    NSString *resposta = self.respostas[self.currentQuestionIndex];
    
    self.respostaLabel.text = resposta;
    
}

- (IBAction)irPraTela2:(id)sender {
    ViewController2 *view = [[ViewController2 alloc] init];
    
    [self presentViewController:view animated:YES completion:nil];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
