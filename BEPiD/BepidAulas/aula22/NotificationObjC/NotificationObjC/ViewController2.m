//
//  ViewController2.m
//  NotificationObjC
//
//  Created by Danilo Barros Mendes on 5/4/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

-(instancetype)initWithNibName: (NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        self.tabBarItem.title = @"View2";
        self.tabBarItem.image = [UIImage imageNamed:@"Time.png"];
        
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _date.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
    
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarItem.badgeValue = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)notificationAlert:(UIButton *)sender {
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    notification.alertBody = @"Minha notificacao";
    notification.fireDate = _date.date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    NSLog(@"Notificacao");
    
    
}

- (IBAction)AddTab:(id)sender {
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self.tabBarController.viewControllers];
    
    UIViewController *new = [UIViewController new];
    
    new.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"New"
                                                   image:[UIImage imageNamed:@"Time.png"]
                                                     tag:[self.tabBarController.viewControllers count]];
    
    [array addObject:new];
    
    
    [self.tabBarController setViewControllers:array animated:YES];
    
    self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",[self.tabBarItem.badgeValue intValue]+1];
    
    //NSLog(@"%lu", (unsigned long)[self.tabBarController.viewControllers count]);
    
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
