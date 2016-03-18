//
//  main.m
//  Aula09
//
//  Created by Danilo Barros Mendes on 2/24/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *now = [NSDate date];
        NSLog(@"%p", now);
        //sleep(5);
        now = [NSDate date];
        NSLog(@"%p", now);
        
        NSString *str = @"string imutavel";
        
        NSMutableString *str2 = [NSMutableString stringWithString:@"string mutavel"];
        str2 = [NSMutableString stringWithString:str];
        
        NSString *string1 = @"É uma string imutavel";
        
        unsigned long len = [string1 length];
        
        NSLog(@"O tamanho da string é: %lu", len);
        
        NSMutableString *str3;
        NSString *str4;
        
        str3 = [NSMutableString stringWithString:@"Essa é a string"];
        str4 = str3;
        
        [str3 appendString:@" lalala"];
        
        NSLog(@"str3 %@ str4 %@",str3, str4);
        
        NSString *str5 = @"lalala lelele lololo";
        NSRange match;
        
        match = [str5 rangeOfString:@"lelele"];

        if(match.location == NSNotFound)
            NSLog(@"Not Found");
        else{
            NSLog(@"sequencia encontrada %lu", match.location);
            NSLog(@"tamanho da sequencia %lu", match.length);
        }
        
        //[str3 replaceCharactersInRange:NSMakeRange(2, 9) withString:@" oioioioi "];
        
        [str3 replaceCharactersInRange:[str3 rangeOfString:@"é a"] withString:@"não é a"];
        
        [str3 deleteCharactersInRange:[str3 rangeOfString:@"não "]];
        
        NSString *str6;
        
        str6 = [str3 substringWithRange:NSMakeRange(0, 6)];
        
        NSLog(@"str 3 %@ str6 %@", str3, str6);
        
        [str3 insertString:@" wwo" atIndex:4];

        NSLog(@"str 3 %@", str3);
        
        if([str3 isEqualToString:str4]){
            NSLog(@"Sao iguais");
        }else{
            NSLog(@"Sao diferentes");
        }
        
        BOOL result;
        
        result = [str3 hasPrefix:@"Essa "];
        
        if(result)
            NSLog(@"Str3 começa com Essa");
        
        result = [str3 hasSuffix:@"lalala"];
        
        if(result)
            NSLog(@"Str3 termina com lalala");
        
        NSString *caps = @"Ae ao AlKd SJSJS";
        NSString *caps2;
        
        caps2 = [caps capitalizedString];
        NSLog(@"%@", caps2);
        
        caps2 = [caps lowercaseString];
        
        caps2 = [caps uppercaseString];
        NSLog(@"%@", caps2);
        
        
        NSString *test = @"200";
        int myint = [test intValue];
        NSLog(@"%i", myint);
        
        test = @"10.404";
        double mydouble = [test doubleValue];
        NSLog(@"%f", mydouble);
        
        test = @"10.403";
        float myfloat = [test floatValue];
        NSLog(@"%f", myfloat);
        
        test = @"100";
        NSInteger myInteger = [test integerValue];
        NSLog(@"%li", myInteger);
        
        NSString *stringg = @"Posso pressentir o perigo e o caos (tan tan tan tan)...";
        const char *utfString = [stringg UTF8String];
        printf("String convertida = %s\n", utfString);
    }
    return 0;
}
