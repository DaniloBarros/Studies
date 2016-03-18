//
//  ViewController2.m
//  Cadastra
//
//  Created by Danilo Barros Mendes on 3/20/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self lerArquivo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)lerArquivo{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/dados.plist"];
    
    NSMutableArray *dados = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    if (dados) {
        _usuarios = dados;
        NSLog(@"Arquivo %@", dados);
    }
    
}

- (IBAction)voltar:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
