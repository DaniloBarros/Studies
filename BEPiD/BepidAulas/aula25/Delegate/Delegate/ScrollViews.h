//
//  ScrollViews.h
//  Delegate
//
//  Created by Danilo Barros Mendes on 5/25/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViews : UIViewController <UIScrollViewDelegate, UIAlertViewDelegate>

@property (nonatomic) UIScrollView *scroll1;
@property (nonatomic) IBOutlet UIButton *button1;
@property (nonatomic) IBOutlet UIButton *button2;
@property (nonatomic) IBOutlet UIButton *button3;

@property (nonatomic) UIScrollView *scroll2;
@property (nonatomic) IBOutlet UIButton *button4;
@property (nonatomic) IBOutlet UIButton *button5;
@property (nonatomic) IBOutlet UIButton *button6;
@end
