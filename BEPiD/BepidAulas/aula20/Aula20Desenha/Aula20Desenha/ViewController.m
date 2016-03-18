//
//  ViewController.m
//  Aula20Desenha
//
//  Created by Danilo Barros Mendes on 3/23/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@property (nonatomic) BOOL retanguloBool;
@property (weak, nonatomic) IBOutlet UIButton *clear;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _subviews = [[NSMutableArray alloc] init];
    
    _arrayCores = @[@"Yellow",
                    @"Blue",
                    @"Green",
                    @"Red",
                    @"Black"];
    self.cor.dataSource = self;
    self.cor.delegate = self;
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    
    
    UIToolbar* numberToolbar2 = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar2.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar2.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad2)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad2)],
                           nil];
    [numberToolbar2 sizeToFit];
    
    
    UIToolbar* numberToolbar3 = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar3.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar3.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad3)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad3)],
                           nil];
    [numberToolbar3 sizeToFit];
    
    
    UIToolbar* numberToolbar4 = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar4.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar4.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad4)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad4)],
                           nil];
    [numberToolbar4 sizeToFit];
    
    
    
    _coordenadaX.inputAccessoryView = numberToolbar;
    _coordenadaY.inputAccessoryView = numberToolbar2;
    _comprimento.inputAccessoryView = numberToolbar3;
    _largura.inputAccessoryView = numberToolbar4;
    
    _retanguloBool = true;
    
    
}

-(void)cancelNumberPad{
    [_coordenadaX resignFirstResponder];
    _coordenadaX.text = nil;
}

-(void)doneWithNumberPad{
    //NSString *numberFromTheKeyboard = numberTextField.text;
    [_coordenadaX resignFirstResponder];
}


-(void)cancelNumberPad2{
    [_coordenadaY resignFirstResponder];
    _coordenadaY.text = nil;
}

-(void)doneWithNumberPad2{
    //NSString *numberFromTheKeyboard = numberTextField.text;
    [_coordenadaY resignFirstResponder];
}


-(void)cancelNumberPad3{
    [_comprimento resignFirstResponder];
    _comprimento.placeholder = nil;
    
}

-(void)doneWithNumberPad3{
    //NSString *numberFromTheKeyboard = numberTextField.text;
    [_comprimento resignFirstResponder];
}


-(void)cancelNumberPad4{
    [_largura resignFirstResponder];
    _largura.text = nil;
}

-(void)doneWithNumberPad4{
    //NSString *numberFromTheKeyboard = numberTextField.text;
    [_largura resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    
    return 1;//Or return whatever as you intend
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [_arrayCores count];//Or, return as suitable for you...normally we use array for dynamic
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _arrayCores[row];//[NSString stringWithFormat:@"Choice-%ld",(long)row];//Or, your suitable title; like Choice-a, etc.
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    //Here, like the table view you can get the each section of each row if you've multiple sections
    NSLog(@"Selected Color: %@. Index of selected color: %ld", [_arrayCores objectAtIndex:row], row);
    
    switch (row) {
        case 0:
            _cores = [UIColor yellowColor];
            break;
        case 1:
            _cores = [UIColor blueColor];
            break;
        case 2:
            _cores = [UIColor greenColor];
            break;
        case 3:
            _cores = [UIColor redColor];
            break;
        case 4:
            _cores = [UIColor blackColor];
            break;
        default:
            _cores = [UIColor grayColor];
            break;
    }
    
    
}

- (IBAction)retanguloAtivado:(UISwitch *)sender {
    if([sender isOn]){
        [_elipse setOn:NO animated:YES];
        _retanguloBool = true;
    }else{
        [_elipse setOn:YES animated:YES];
        _retanguloBool = false;
    }
}

- (IBAction)elipseAtivado:(UISwitch *)sender {
    if([sender isOn]){
        [_retangulo setOn:NO animated:YES];
        _retanguloBool = false;
    }else{
        [_retangulo setOn:YES animated:YES];
        _retanguloBool = true;
    }
}

- (IBAction)desenha:(id)sender {
    ViewController2 *view = [[ViewController2 alloc] init];
    
    //[view setCor:_cores];
    
    float x = [_coordenadaX.text floatValue];
    
    if(x >= self.view.bounds.size.width || x<=0){
        NSLog(@"Limite X Ultrapassado");
        x = 0;
    }
    
    
    float y = [_coordenadaY.text floatValue];
    
    if(y >= self.view.bounds.size.height || y<=0){
        NSLog(@"Limite Y Ultrapassado");
        y = 0;
    }
    
    CGRect frame = CGRectMake(x, y, [_comprimento.text floatValue], [_largura.text floatValue]);
    
    if (_retanguloBool) {
        
        _rect = [[Retangulo alloc] initWithFrame:frame];
        _rect.backgroundColor = _cores;
        
        [_subviews addObject:_rect];
    }else{
        _elip = [[Elipse alloc] initWithFrame:frame eCor:_cores];
        _elip.backgroundColor = [UIColor clearColor];
        [_subviews addObject:_elip];
    }
    
    
    
    
    
    /*[view setX:x];
    [view setY:y];
    [view setComprimento:[_comprimento.text floatValue]];
    [view setLargura:[_largura.text floatValue]];
    [view setDesenhaRetangulo:_retanguloBool];
    */
    if (_comprimento == nil) {
        NSLog(@"comprimento nil");
    }
    if (_comprimento == nil || _largura == nil || _coordenadaX == nil || _coordenadaY ==nil) {
        //[self clear:nil];
    }else{
        [view setSubviews:_subviews];
        [self presentViewController:view animated:YES completion:nil];
        
    }
}

- (IBAction)clear:(UIButton *)sender {
    _subviews = [[NSMutableArray alloc] init];
    
    [_retangulo setOn:YES animated:YES];
    _retanguloBool = true;
    [_elipse setOn:NO animated:YES];
    
    [self cancelNumberPad];
    [self cancelNumberPad2];
    [self cancelNumberPad3];
    [self cancelNumberPad4];
    
    [self.cor selectRow:0 inComponent:0 animated:YES];
    
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
