//
//  main.m
//  Aula16
//
//  Created by Danilo Barros Mendes on 3/17/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *stocks = [[NSMutableArray alloc] init];
        
        NSMutableDictionary *stock1 = [[NSMutableDictionary alloc] init];
        [stock1 setObject:@"DBM" forKey:@"abreviacao"];
        [stock1 setObject:@"Danilo Barros Mendes" forKey:@"nome"];
        [stock1 setObject:[NSNumber numberWithInt:19] forKey:@"idade"];
        
        [stocks addObject:stock1];
        
        NSMutableDictionary *stock2 = [[NSMutableDictionary alloc] init];
        [stock2 setObject:@"TGA" forKey:@"abreviacao"];
        [stock2 setObject:@"Tais Goulart Almeida" forKey:@"nome"];
        [stock2 setObject:[NSNumber numberWithInt:20] forKey:@"idade"];
        
        [stocks addObject:stock2];
        
        BOOL result = [stocks writeToFile:@"/tmp/stocks.plist" atomically:YES];
        
        if (!result)
            exit(1);
        
        NSArray *stockList = [NSArray arrayWithContentsOfFile:@"/tmp/stocks.plist"];
        
        for (NSDictionary *item in stockList) {
            NSLog(@"%@",item);
        }
        
        
    }
    return 0;
}
