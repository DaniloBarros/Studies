//
//  main.m
//  init
//
//  Created by Danilo Barros Mendes on 3/12/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pessoa.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Pessoa *eu = [[Pessoa alloc] initWithName:@"Jose"];
        
        NSLog(@"%@",eu);
    }
    return 0;
}
