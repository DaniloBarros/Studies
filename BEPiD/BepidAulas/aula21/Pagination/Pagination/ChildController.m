//
//  ChildController.m
//  Pagination
//
//  Created by Danilo Barros Mendes on 3/26/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ChildController.h"

@interface ChildController ()

@end

@implementation ChildController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.screenLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.window.center.x, self.view.window.center.y, 100, 100)];
    
    self.screenLabel.text = [NSString stringWithFormat:@"Screen %ld", (long)self.index];
    self.screenLabel.textColor = [UIColor whiteColor];
    
    [[self view] addSubview:_screenLabel];
    
    
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
