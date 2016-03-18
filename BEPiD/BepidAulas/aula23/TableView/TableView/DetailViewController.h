//
//  DetailViewController.h
//  TableView
//
//  Created by Danilo Barros Mendes on 5/12/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic) NSString *details;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end
