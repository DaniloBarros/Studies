//
//  AppDelegate.h
//  BancoDados
//
//  Created by Danilo Barros Mendes on 7/7/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) NSString *databaseName;
@property (nonatomic) NSString *databasePath;

@end

