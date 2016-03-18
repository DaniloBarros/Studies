//
//  Funcionario.m
//  Funcionario
//
//  Created by Danilo Barros Mendes on 3/11/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "Funcionario.h"

@implementation Funcionario

-(BOOL) isProfessor{
    if([self.departamento isEqualToString:@"DP" ]){
        NSLog(@"Ta no DP, provavelmente e um professor");
        return YES;
    }else{
        NSLog(@"Nao e um professor");
        return NO;
    }
}

@end
