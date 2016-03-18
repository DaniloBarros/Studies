//
//  ViewController.m
//  NotificationObjC
//
//  Created by Danilo Barros Mendes on 5/4/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(instancetype)initWithNibName: (NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        self.tabBarItem.title = @"View1";
        self.tabBarItem.image = [UIImage imageNamed:@"Time.png"];
        _viewNames = [[NSMutableArray alloc] init];
        
        
    }
    
    return self;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"View1";
        self.tabBarItem.image = [UIImage imageNamed:@"Time.png"];
        _viewNames = [[NSMutableArray alloc] init];
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    _numControllers = (int)[self.tabBarController.viewControllers count];
    
    self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",
                                  (long)[UIApplication sharedApplication].applicationIconBadgeNumber];
    
    
    self.tabBarItem.badgeValue = nil;
}


-(void)viewWillAppear:(BOOL)animated{
    
    
    NSArray *viewControllers = self.tabBarController.viewControllers;
    NSMutableString *name = [[NSMutableString alloc] initWithString:[[viewControllers[0] tabBarItem] title]];
    
    _numControllers = (int)[self.tabBarController.viewControllers count];
    
    for (int i=1; i<_numControllers; i++){
        name = (NSMutableString *)[name stringByAppendingString:
                                   [NSString stringWithFormat:@", %@",
                                    [[viewControllers[i] tabBarItem] title]]];
    }
    _textView.text = name;
    
    _label.text = [NSString stringWithFormat:@"%d Tabs", _numControllers];
    
    //int tabCount = (int)[self.tabBarController.viewControllers count];
    self.tabBarItem.badgeValue = nil;
    
}

- (IBAction)addNotification:(UIButton *)sender {
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    notification.alertBody = @"Notificacao adicionada";
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    notification.soundName = @"notificationSound.mp3";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    long badgeNumber = (long)[UIApplication sharedApplication].applicationIconBadgeNumber;
    
    self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", badgeNumber];
    
    [UIApplication sharedApplication].applicationIconBadgeNumber++;
    badgeNumber++;
    
    self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", badgeNumber];
    
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
