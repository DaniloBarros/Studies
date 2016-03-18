//
//  main.m
//  Aula08Objetos
//
//  Created by Danilo Barros Mendes on 2/23/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *now = [NSDate date];
        NSHost *test = [NSHost currentHost];

        double seconds = [now timeIntervalSince1970];
        
        NSString *str = [test name];
        NSLog(@"A data atual %@, segundos %f, host %@", now, seconds, str);
    }
    return 0;
}
