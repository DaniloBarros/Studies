//
//  Retangulo.m
//  Bandeira
//
//  Created by Danilo Barros Mendes on 3/26/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "Retangulo.h"

@implementation Retangulo

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame eCor:(UIColor*)cor
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:cor];
    }
    return self;
}



@end
