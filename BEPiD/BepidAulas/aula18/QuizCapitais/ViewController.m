//
//  ViewController.m
//  QuizCapitais
//
//  Created by Danilo Barros Mendes on 3/19/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pressReturn:(UITextField *)sender {

    ViewController2 *view = [[ViewController2 alloc] init];
    
    view.nome = self.nome.text;
    
    [self presentViewController:view animated:YES completion:nil];
    
    
}

- (IBAction)irParaAsPerguntas:(id)sender {
    
    ViewController2 *view = [[ViewController2 alloc] init];
    
    view.nome = self.nome.text;
    
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
