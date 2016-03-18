//
//  AppDelegate.m
//  Aula20
//
//  Created by Danilo Barros Mendes on 3/23/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "AppDelegate.h"
#import "MARView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    CGRect firstFrame = CGRectMake(0, 0, 150, 150);
    
    MARView *firstView = [[MARView alloc] initWithFrame:firstFrame];
    
    firstView.backgroundColor = [UIColor orangeColor];

    CGRect secondFrame = CGRectMake(10, 40, 100, 50);
    
    MARView *secondView = [[MARView alloc] initWithFrame:secondFrame];
    secondView.backgroundColor = [UIColor greenColor];
    
    [firstView addSubview:secondView];
    
    CGRect thirdFrame = CGRectMake(self.window.bounds.size.width, self.window.bounds.size.height, -100, -50);
    
    MARView *thirdView = [[MARView alloc] initWithFrame:thirdFrame];
    thirdView.backgroundColor = [UIColor grayColor];
    
    
    [self.window addSubview:firstView];
    [self.window addSubview:thirdView];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
