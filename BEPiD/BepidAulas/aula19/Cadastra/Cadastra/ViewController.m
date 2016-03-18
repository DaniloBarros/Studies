//
//  ViewController.m
//  Cadastra
//
//  Created by Danilo Barros Mendes on 3/20/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _usuarios = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)fecharTeclado:(id)sender {
    
    [self.view endEditing:YES];
    
}
- (IBAction)editEnded:(id)sender {
    [self.view endEditing:YES];
    
    
}

- (IBAction)gravarUsuario:(UIButton *)sender {
    
    if (_nome.hasText && _email.hasText) {
        
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
        
        [dictionary setValue:_email.text forKey:_nome.text];
        
        
        [_usuarios addObject:dictionary];
        
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/dados.plist"];

        BOOL result = [[self usuarios] writeToFile:path atomically:YES];
        if (result) {
            NSLog(@"%d Gravou", result);
        }
        
        
        _nome.text=@"";
        _email.text=@"";
        
    }
    
}

- (IBAction)listarUsuarios:(id)sender {
    
    ViewController2 *view = [[ViewController2 alloc] init];
    
    //[view setUsuarios:_usuarios];
    
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
