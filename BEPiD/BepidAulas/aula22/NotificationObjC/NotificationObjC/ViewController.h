//
//  ViewController.h
//  NotificationObjC
//
//  Created by Danilo Barros Mendes on 5/4/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic) int numControllers;
@property (nonatomic) NSMutableArray *viewNames;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
