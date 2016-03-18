//
//  ViewController.m
//  BancoDados
//
//  Created by Danilo Barros Mendes on 7/7/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController.h"
#import "AlunoDAO.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//
//-(void)post{
//    NSString *post = [[NSString alloc] initWithFormat:@"username=%@password=%@", [self.username text], [self.password text]];
//    
//    NSLog(@"PostData: %@",post);
//    
//    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1:8888/webService.php"];
//    
//    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//    
//    NSString *postLenght = [NSString stringWithFormat:@"%lu",(unsigned long) [postData length] ];
//    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    
//    [request setURL:url];
//    [request setHTTPMethod:@"POST"];
//    [request setValue:postLenght forHTTPHeaderField:@"Content-Lenght"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setValue:@"application/x-www-form-urlenconded" forHTTPHeaderField:@"Content-type"];
//    [request setHTTPBody:postData];
//}
//
//-(void) result:(NSURLRequest*)request{
//    NSError *error = [[NSError alloc] init];
//    NSHTTPURLResponse *response = nil;
//    NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//    
//    NSLog(@"Response code: %ld", (long)[response statusCode]);
//    
//    if ([response statusCode] >= 200 && [response statusCode] < 300) {
//        NSString *responseData = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
//        
//        NSLog(@"Response => %@", responseData);
//        
//        NSError *error = nil;
//        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:urlData options:NSJSONReadingMutableContainers error:&error];
//        
//        BOOL success;
//        
//        success = [jsonData[@"success"] integerValue];
//        
//        NSLog(@"Sucess: %ld", (long)success );
//        
//    }
//    
//}

- (IBAction)add:(UIButton *)sender {
    
    if ([self.username.text isEqualToString: @""] || [self.password.text isEqualToString:@""] || [self.email.text isEqualToString:@""]) {

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Campo(s) em branco" message:@"Preencha todos os campos!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alert show];
        return;
    }
    
    Usuario *usr = [[Usuario alloc] initWithDatas:0
                                             nome:_username.text
                                     emailUsuario:_email.text
                                     senhaUsuario:_password.text
                                  situacaoUsuario: _switchh.isOn ? @"A":@"I"];
    
    [[AlunoDAO sharedInstance] insertUsuario:usr];
    
}

@end
