//
//  ViewController.m
//  DesafioText
//
//  Created by Danilo Barros Mendes on 5/28/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController.h"
#import "Usuario.h"

@interface ViewController ()

@property (nonatomic) UIAlertView *alertSucess;
@property (nonatomic) UIAlertView *alertFailure;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _nomeField.delegate = self;
    _cpfField.delegate = self;
    _telField.delegate = self;
    _senhaField.delegate = self;
    
    _nomeField.enablesReturnKeyAutomatically = YES;
}

- (BOOL)addToMyPlist:(NSData*)new {
    // set file manager object
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // check if file exists
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"Users.plist"];//usuarios.plist
    
    BOOL isExist = [manager fileExistsAtPath:plistPath];
    // BOOL done = NO;
    
    if (!isExist) {
        
        NSArray *plistA = [[NSArray alloc] initWithObjects:new, nil];
        
        BOOL iswriten = [plistA writeToFile:plistPath atomically:YES];
        
        return iswriten;
    }
    
    // get data from plist file
    NSMutableArray * plistArray = [[NSMutableArray alloc]
                                   initWithContentsOfFile:plistPath];
    
    [plistArray insertObject:new atIndex:0];
    
    // write data to  plist file
    BOOL isWritten = [plistArray writeToFile:plistPath atomically:YES];
    //[plistArray writeToFile:plistPath atomically:YES];
    
    //NSLog(@"%@",plistArray);
    
    return isWritten;
    
}

-(BOOL)isSenhaValida{
    
    BOOL senhaValida=NO;
    int up=0;
    int dg=0;
    
    for (int i=0; i<[_senhaField.text length]; i++) {
        char senhaChar = [_senhaField.text characterAtIndex:i];
        
        if (isupper(senhaChar)) {
            up++;
            continue;
        }
        if (isdigit(senhaChar)) {
            dg++;
            continue;
        }
        
    }
    
    if (up>=2 && dg>=2) {
        senhaValida=YES;
    }
    
    return senhaValida;
}

-(NSString*)validaCadastro:(UITextField*)textField {
    
    NSString *erro;
    
    if (!textField) {
    
        if ([self.nomeField.text length]<=1) {
            erro = @"Insira um nome valido!";
        }else if ([self.cpfField.text length]<14){
            erro = @"Insira um CPF valido!";
        }else if ([self.telField.text length]<18 && [self.telField.text length]>0){
            erro = @"Insira um telefone valido, no formato [+##](##)####-####";
        }else if([self.senhaField.text length]<=5 || ![self isSenhaValida]){
            erro = @"Senha invalida! Entre com uma senha com 6 caracteres, com 2 Maiuscula e 2 digitos.";
        }
        
    }else if ([textField isEqual:self.nomeField]){
        if ([self.nomeField.text length]<=1) {
            erro = @"Insira um nome valido!";
        }
    }else if ([textField isEqual:self.cpfField]){
        if ([self.cpfField.text length]<14){
            erro = @"Insira um CPF valido!";
        }
    }else if ([textField isEqual:self.telField]){
        if ([self.telField.text length]<18 && [self.telField.text length]>0){
            erro = @"Insira um telefone valido, no formato [+##](##)####-####";
        }
    }else if ([textField isEqual:self.senhaField]){
        if([self.senhaField.text length]<=5 || [self isSenhaValida]){
            erro = @"Senha invalida! Entre com uma senha com 6 caracteres, com 2 Maiuscula e 2 digitos.";
        }
    }
    
    
    return erro;
}

-(void)salvar{
    
    /*
     NSDictionary *newUser = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
     _nomeField.text, @"nome",
     _cpfField.text, @"cpf",
     _telField.text, @"telefone",
     _senhaField.text, @"senha",nil];
     
     NSLog(@"%@", newUser);
     
     */
    
    Usuario *user = [[Usuario alloc] initWithNome:_nomeField.text
                                              cpf:_cpfField.text
                                         telefone:_telField.text
                                            senha:_senhaField.text
                                     dataCadastro:[NSDate date]];
    
    NSData *newUser = [NSKeyedArchiver archivedDataWithRootObject:user];
    
    
    BOOL written = [self addToMyPlist:newUser];
    
    if (!written) {
        
        _alertFailure = [[UIAlertView alloc] initWithTitle:@"Falha"
                                                   message:@"Houve uma falha no cadastro :( Tente novamente."
                                                  delegate:self
                                         cancelButtonTitle:@"Ok"
                                         otherButtonTitles: nil];
        
        [_alertFailure show];
        return ;
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sucesso!"
                                                    message:@"Salvou com sucesso!"
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles: nil];
    [alert show];
}


- (IBAction)cadastrar:(UIButton *)sender {
    
    _alertSucess = [[UIAlertView alloc] initWithTitle:@"Salvar?"
                                              message:@"Você deseja realmente salvar os dados?\rCerteza??"
                                             delegate:self
                                    cancelButtonTitle:@"Cancelar"
                                    otherButtonTitles: @"Salvar",nil];
    
    
    NSString *erroMsg = [self validaCadastro:nil];
    
    if (erroMsg) {
        
        _alertFailure = [[UIAlertView alloc] initWithTitle:@"Erro!"
                             message:erroMsg
                            delegate:self
                   cancelButtonTitle:@"Ok"
                   otherButtonTitles: nil];
        
        [_alertFailure show];
        return ;
    }
    
    
    [_alertSucess show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if ([alertView isEqual: self.alertSucess]) {
        
        if (buttonIndex == 1) {
            [self salvar];
        }else{
            NSLog(@"Nao salvou");
        }
        
    }else if ([alertView isEqual:self.alertFailure]){
        //Falhou! Aceita que doi menos;
    }
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    NSInteger next = textField.tag +1;
    
    UIResponder *nextResponder = [textField.superview viewWithTag:next];
    
    
    if (nextResponder) {
        NSString *erro = [self validaCadastro:textField];
        
        if (erro) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro!"
                                                            message:erro
                                                           delegate:self
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles: nil];
            [alert show];
        
        }else{
            [nextResponder becomeFirstResponder];
        }
    }else{
        [textField resignFirstResponder];
        //[self cadastrar:nil];
    }
    
    return NO;
    
}

-(NSString *)filteredStringFromStringWithFilter:(NSString *)string filter:(NSString *)filter
{
    NSUInteger onOriginal = 0, onFilter = 0, onOutput = 0;
    char outputString[([filter length])];
    BOOL done = NO;
    
    while(onFilter < [filter length] && !done)
    {
        char filterChar = [filter characterAtIndex:onFilter];
        char originalChar = onOriginal >= string.length ? '\0' : [string characterAtIndex:onOriginal];
        switch (filterChar) {
            case '#':
                if(originalChar=='\0')
                {
                    // We have no more input numbers for the filter.  We're done.
                    done = YES;
                    break;
                }
                if(isdigit(originalChar))
                {
                    outputString[onOutput] = originalChar;
                    onOriginal++;
                    onFilter++;
                    onOutput++;
                }
                else
                {
                    onOriginal++;
                }
                break;
            default:
                // Any other character will automatically be inserted for the user as they type (spaces, - etc..) or deleted as they delete if there are more numbers to come.
                outputString[onOutput] = filterChar;
                onOutput++;
                onFilter++;
                if(originalChar == filterChar)
                    onOriginal++;
                break;
        }
    }
    outputString[onOutput] = '\0'; // Cap the output string
    return [NSString stringWithUTF8String:outputString];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *filter;
    
    if (textField == _telField) {
        
        filter = @"[+##](##)####-####";
    
    }else if (textField == _cpfField){
        filter = @"###.###.###-##";
    }
    
    
    if(!filter) return YES; // No filter provided, allow anything
    
    NSString *changedString = [textField.text
                               stringByReplacingCharactersInRange:range
                               withString:string];
    
    if(range.length == 1 && // Only do for single deletes
       string.length < range.length &&
       [[textField.text substringWithRange:range]
        rangeOfCharacterFromSet:
        [NSCharacterSet characterSetWithCharactersInString:@"0123456789"]].location == NSNotFound)
    {
        // Something was deleted.  Delete past the previous number
        NSInteger location = changedString.length-1;
        if(location > 0)
        {
            for(; location > 0; location--)
            {
                if(isdigit([changedString characterAtIndex:location]))
                {
                    break;
                }
            }
            changedString = [changedString substringToIndex:location];
        }
    }
    
    textField.text = [self filteredStringFromStringWithFilter:changedString filter:filter];
    
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
