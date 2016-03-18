//
//  ViewController.h
//  TableView
//
//  Created by Danilo Barros Mendes on 5/11/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <
            UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *minhaTableView;

@property(strong, nonatomic) NSMutableArray *numbers;

@end
