//
//  main.m
//  Aula08Metodos
//
//  Created by Danilo Barros Mendes on 2/23/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDateComponents *comp = [[NSDateComponents alloc] init];
        [comp setDay:23];
        [comp setMonth:1];
        [comp setYear:2045];
        [comp setHour:1];
        [comp setMinute:23];
        [comp setSecond:45];
        
        NSDate *atual = [NSDate date];
        
        NSCalendar *gregoriano = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        NSDate *fimDoMundo = [gregoriano dateFromComponents:comp];
        
        NSDateComponents *segundos = [gregoriano components:NSCalendarUnitSecond
                                                   fromDate:atual
                                                     toDate:fimDoMundo
                                                    options:0];
        
        //NSLog(@"Faltam %ld segundos para o fim do mundo", [segundos second]);
        printf("Faltam %ld segundos para o fim do mundo\n", [segundos second]);
    }
    return 0;
}
