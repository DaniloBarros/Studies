//
//  Persistence.h
//  CoreLocation1
//
//  Created by Danilo Barros Mendes on 7/17/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface Persistence : NSObject

@property (nonatomic) NSString *pathDatabase;
@property (strong, nonatomic) FMDatabase *dataBase;

+(instancetype)sharedInstance;
-(void)addLocation:(double)latitude Longitude:(double)longitude;


@end
