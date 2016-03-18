//
//  Elipse.m
//  Aula20Desenha
//
//  Created by Danilo Barros Mendes on 3/24/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "Elipse.h"

@implementation Elipse

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */

- (instancetype)initWithFrame:(CGRect)frame eCor:(UIColor*)cor
{
    self = [super initWithFrame:frame];
    if (self) {
        _cor = cor;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context= UIGraphicsGetCurrentContext();
 
    CGContextSetFillColorWithColor(context, _cor.CGColor);
    CGContextSetAlpha(context, 1);
    CGContextFillEllipseInRect(context, CGRectMake(0,0,self.frame.size.width,self.frame.size.height));
    
}


@end
