//
//  Estrela.m
//  Bandeira
//
//  Created by Danilo Barros Mendes on 3/26/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "Estrela.h"

@implementation Estrela

- (instancetype)initWithFrame:(CGRect)frame eCor:(UIColor*)cor
{
    self = [super initWithFrame:frame];
    if (self) {
        _cor = cor;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    int aSize = 100.0;
    //float color[4] = { 0.0, 0.0, 1.0, 1.0 }; // Blue
    
    CGColorRef aColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), _cor);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, aSize);
    
    CGFloat xCenter = 100.0;
    CGFloat yCenter = 100.0;
     
    float  w = 100.0;
    double r = w / 2.0;
    float flip = -1.0;
     
    CGContextSetFillColorWithColor(context, aColor);
     
     
    CGContextSetStrokeColorWithColor(context, aColor);
     
    double theta = 2.0 * M_PI * (2.0 / 5.0); // 144 degrees
     
    CGContextMoveToPoint(context, xCenter, r*flip+yCenter);
     
    for (NSUInteger k=1; k<5; k++){
        
        float x = r * sin(k * theta);
        float y = r * cos(k * theta);
        CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
    }
     
    CGContextClosePath(context);
    
    CGContextFillPath(context);
}


@end
