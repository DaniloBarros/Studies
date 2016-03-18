//
//  ViewController.m
//  AutoLayout
//
//  Created by Danilo Barros Mendes on 6/29/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)alterar:(UIButton *)sender {
    
    if(self.vermelhoHeight.constant != 50){
        self.verdeHeight.constant = 50.0;
        [self.vermelhoHeight setConstant:50];
    }else{
        self.verdeHeight.constant = 155;
        [self.vermelhoHeight setConstant:155];
    }
}

@end
