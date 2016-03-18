//
//  ViewController.m
//  Desafio7
//
//  Created by Danilo Barros Mendes on 5/19/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UITextField *activeField;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _datePicker.maximumDate = [NSDate date];
    
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithTitle:@"Salvar" style:UIBarButtonItemStyleDone target:self action:@selector(salvar:)];
    
    self.navigationItem.rightBarButtonItem = save;
    
    self.toolBar.delegate = self;
    
    self.navigationItem.title = @"Nova Pessoa";
    
    [_scrollView addSubview:_imageCria];
    [_scrollView addSubview:_tipoSegment];
    [_scrollView addSubview:_datePicker];
    [_scrollView addSubview:_nomeText];
    [_scrollView addSubview:_kitLabel];
    [_scrollView addSubview:_kitText];
    
    _scrollView.contentSize = CGSizeMake(_contentView.frame.size.width, _contentView.frame.size.height + 200);
}
- (void)addToMyPlist:(NSDictionary*)new {
    // set file manager object
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // check if file exists
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"contacts.plist"];
    
    BOOL isExist = [manager fileExistsAtPath:plistPath];
    // BOOL done = NO;
    
    if (!isExist) {
        // NSLog(@"MyPlistFile.plist does not exist");
        // done = [manager copyItemAtPath:file toPath:fileName error:&error];
    }
    // NSLog(@"done: %d",done);
    
    // get data from plist file
    NSMutableArray * plistArray = [[NSMutableArray alloc]
                                   initWithContentsOfFile:plistPath];
    
    // create dictionary using array data and bookmarkKeysArray keys
    NSArray *keysArray = [[NSArray alloc] initWithObjects:@"StudentNo", nil];
    NSArray *valuesArray = [[NSArray alloc] initWithObjects:
                            [NSString stringWithFormat:@"1234"], nil];
    
    NSDictionary *plistDict = [[NSDictionary alloc]
                              initWithObjects:valuesArray
                              forKeys:keysArray];
    
    [plistArray insertObject:new atIndex:0];
    
    // write data to  plist file
    //BOOL isWritten = [plistArray writeToFile:plistPath atomically:YES];
    [plistArray writeToFile:plistPath atomically:YES];
    
    plistArray = nil;
    
    // check for status
    // NSLog(@" \n  written == %d",isWritten);
}

-(void)salvar:(id)sender{
    
    //Incluir Usuario no Plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"contacts" ofType:@"plist"];
    NSArray *contato = [NSArray arrayWithContentsOfFile:path];
    
    NSDictionary *novoContato = [NSDictionary dictionary];
    
    if (self.tipoSegment.selectedSegmentIndex == 0) {
        [novoContato setValue:@"Aluno" forKey:@"tipo"];
        [novoContato setValue:self.kitText.text forKey:@"kit"];
    }else if (self.tipoSegment.selectedSegmentIndex == 1){
        [novoContato setValue:@"Aluna" forKey:@"tipo"];
        [novoContato setValue:self.kitText.text forKey:@"kit"];
    }else{
        [novoContato setValue:@"Professor" forKey:@"tipo"];
    }
    
    [novoContato setValue:self.nomeText.text forKey:@"nome"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    NSString *dataNascimento = [formatter stringFromDate:_datePicker.date];
    
    [novoContato setValue:dataNascimento forKey:@"nascimento"];
    
    if (_imageCria.image == nil) {
        [novoContato setValue:@"" forKey:@"image"];
    }else{
        NSData *imageData = UIImagePNGRepresentation(_imageCria.image);
    
        [novoContato setValue:imageData forKey:@"image"];
    }
    
    [self addToMyPlist:novoContato];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changedValue:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == 2) {
        _kitLabel.hidden = YES;
        _kitText.hidden = YES;
        _kitText.text = nil;
    }else{
        _kitLabel.hidden = NO;
        _kitText.hidden = NO;
        _kitText.placeholder = @"Numero do Kit";
    }
}
- (IBAction)takePicture:(UIBarButtonItem *)sender {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.allowsEditing = YES;
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *image = info[UIImagePickerControllerEditedImage];
    
    _imageCria.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _activeField = textField;
    
    NSLog(@"EditBegan");
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _activeField = nil;
}

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, _activeField.frame.origin) ) {
        [self.scrollView scrollRectToVisible:_activeField.frame animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
}



- (IBAction)editEndedNome:(UITextField *)sender {
    [sender resignFirstResponder];
}
- (IBAction)editEndedKit:(UITextField *)sender {
    [sender resignFirstResponder];
    
}
- (IBAction)resingtext:(id)sender {
    [sender resignFirstResponder];
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
