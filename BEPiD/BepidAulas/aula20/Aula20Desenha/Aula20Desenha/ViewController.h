//
//  ViewController.h
//  Aula20Desenha
//
//  Created by Danilo Barros Mendes on 3/23/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Retangulo.h"
#import "Elipse.h"

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic) IBOutlet UITextField *coordenadaX;
@property (nonatomic,weak) IBOutlet UITextField *coordenadaY;
@property (nonatomic,weak) IBOutlet UITextField *largura;
@property (nonatomic,weak) IBOutlet UITextField *comprimento;

@property (nonatomic,weak) IBOutlet UIButton *desenha;
@property (nonatomic,weak) IBOutlet UIPickerView *cor;

@property (nonatomic) NSArray *arrayCores;

@property (nonatomic) UIColor *cores;

@property (nonatomic, weak) IBOutlet UISwitch *elipse;
@property (nonatomic, weak) IBOutlet UISwitch *retangulo;

@property (nonatomic) Retangulo *rect;
@property (nonatomic) Elipse *elip;

@property (nonatomic) NSMutableArray *subviews;

-(void)cancelNumberPad;
-(void)doneWithNumberPad;

-(void)cancelNumberPad2;
-(void)doneWithNumberPad2;

-(void)cancelNumberPad3;
-(void)doneWithNumberPad3;

-(void)cancelNumberPad4;
-(void)doneWithNumberPad4;

@end
