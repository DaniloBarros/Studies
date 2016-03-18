//
//  main.m
//  Aula2
//
//  Created by Danilo Barros Mendes on 2/9/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        char birth[15], name[50];
        
        printf("Entre com seu nome: ");
        gets(name);
        printf("Entre com a data de nascimento (aaaa-mm-dd): ");
        scanf("%s", birth);
        
        NSString *birthDate = [NSString stringWithUTF8String:birth];
        
        NSDateFormatter *f = [[NSDateFormatter alloc] init];
        [f setDateFormat:@"yyyy-MM-dd"];
        NSDate *start = [f dateFromString:birthDate];
        NSDate *today = [NSDate date];
        
        NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
       
        
        NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay
                                                            fromDate:start
                                                              toDate:today
                                                             options:0];
        
        NSDateComponents *components2 = [gregorianCalendar components:NSCalendarUnitHour
                                                            fromDate:start
                                                              toDate:today
                                                             options:0];

        
        NSDateComponents *components3 = [gregorianCalendar components:NSCalendarUnitMinute
                                                            fromDate:start
                                                              toDate:today
                                                             options:0];
        
        NSDateComponents *components4 = [gregorianCalendar components:NSCalendarUnitSecond
                                                             fromDate:start
                                                               toDate:today
                                                              options:0];
        
        printf("\n\n\"%s\" viveu:\n\"%ld dias\"\n\"%ld horas\"\n\"%ld minutos\"\n\"%ld segundos\"  ate hoje\n", name, [components day], [components2 hour], [components3 minute], [components4 second]);
    }
    return 0;
}
