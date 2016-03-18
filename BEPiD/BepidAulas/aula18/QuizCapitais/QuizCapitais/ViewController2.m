//
//  ViewController2.m
//  QuizCapitais
//
//  Created by Danilo Barros Mendes on 3/19/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController3.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nomeUsuario.text = self.nome;
    self.pont.text = @"0";
    
    self.perguntas = @[@"Qual a capital do Egito?",
                       @"Qual a capital da Belgica?",
                       @"Qual a capital da Lituania?",
                       @"Qual a capital da Turquia?",
                       @"Qual a capital do Vaticano?",
                       @"Qual a capital da Dinamarca?",
                       @"Qual a capital da Republica Tcheca?",
                       @"Qual a capital de Malta?",
                       @"Qual a capital da Finlandia?",
                       @"Qual a capital do Suriname?"];
    
    self.capitais = @[@"Cairo",
                      @"Bruxelas",
                      @"Vilnius",
                      @"Ancara",
                      @"Cidade do Vaticano",
                      @"Copenhagem",
                      @"Praga",
                      @"Valetta",
                      @"Helsinque",
                      @"Paramaribo"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)consultarResposta:(id)sender {
    
    if (![self.perguntasLabel.text isEqualToString:@"Clique abaixo para começar!"]) {
        
        NSString *resposta = self.capitais[self.perguntaIndice];
    
        self.capitaisLabel.text = resposta;
    
    }
}


- (IBAction)proximaPergunta:(id)sender {
    self.perguntaIndice++;
    
    if (self.perguntaIndice == [self.perguntas count]) {
        self.perguntaIndice = 0;
    }
    
    NSString *pergunta = self.perguntas[self.perguntaIndice];
    
    self.perguntasLabel.text = pergunta;
    self.capitaisLabel.text = @"????";
    
}


- (IBAction)adicionarPontuacao:(UIStepper*)sender {
    
    double valor = [sender value];
    
    [[self pont]setText:[NSString stringWithFormat:@"%d", (int)valor]];
    
    if (valor==5) {
        
        [[self pont] setText:@"0"];
        
        self.perguntasLabel.text = @"Clique abaixo para começar!";
        self.capitaisLabel.text = @"????";
        
        [sender setValue:0];
        
        ViewController3 *view = [[ViewController3 alloc] init];
        
        [self presentViewController:view animated:YES completion:nil];
        
    }
    
    
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
