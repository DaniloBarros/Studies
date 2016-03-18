//
//  ViewController.h
//  Desafio2
//
//  Created by Danilo Barros Mendes on 3/25/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>{
    UIScrollView *scroll;
    UIPageControl *page;
    
    BOOL pageControlBeingUsed;
}

@property (retain, nonatomic) IBOutlet UIScrollView *scroll;
@property (retain, nonatomic) IBOutlet UIPageControl *page;

@end
