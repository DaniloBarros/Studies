//
//  DetailsViewViewController.m
//  TableViewCell
//
//  Created by Danilo Barros Mendes on 5/13/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "DetailsViewViewController.h"

@interface DetailsViewViewController ()

@end

@implementation DetailsViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _telefone.text = _tel;

    
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
