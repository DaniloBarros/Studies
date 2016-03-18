//
//  Persistence.m
//  CoreLocation1
//
//  Created by Danilo Barros Mendes on 7/17/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "Persistence.h"

@implementation Persistence



- (instancetype)init
{
    self = [super init];
    if (self) {
        //READ-ONLY
        //self.pathDatabase = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"CoreLocation.sqlite"];
        
        //NO SUCH TABLE
        self.dataBase = [FMDatabase databaseWithPath:self.pathDatabase];
    }
    return self;
}

+(instancetype)sharedInstance{
    
    static dispatch_once_t pred=0;
    static Persistence *_sharedInstance = nil;
    
    dispatch_once(&pred, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    
    return _sharedInstance;
}

-(void)addLocation:(double)latitude Longitude:(double)longitude{
    
    
    [self.dataBase open];
    
    [self.dataBase executeUpdate:@"INSERT INTO Location (latitute, longitude) VALUES (?,?)",latitude, longitude];
    
    NSLog(@"Error: %@", [self.dataBase lastErrorMessage]);
    [self.dataBase close];
    
    
}


@end
