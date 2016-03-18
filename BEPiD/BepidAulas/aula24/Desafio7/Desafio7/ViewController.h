//
//  ViewController.h
//  Desafio7
//
//  Created by Danilo Barros Mendes on 5/19/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UIToolbarDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageCria;

@property (weak, nonatomic) IBOutlet UISegmentedControl *tipoSegment;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UITextField *nomeText;

@property (weak, nonatomic) IBOutlet UITextField *kitText;
@property (weak, nonatomic) IBOutlet UILabel *kitLabel;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;


@end
