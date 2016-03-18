//
//  PrincipalView.m
//  Aula21
//
//  Created by Danilo Barros Mendes on 3/25/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "PrincipalView.h"

@implementation PrincipalView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    CGRect bounds = self.bounds;
    
    CGPoint center = self.center;
    
    center.x = bounds.origin.x + bounds.size.width/2.0;
    
    center.y = bounds.origin.y + bounds.size.height/2.0;
    
    float radius = (MIN(bounds.size.width, bounds.size.height))/2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path addArcWithCenter:center radius:radius startAngle:0.0 endAngle:M_PI*2 clockwise:YES];
    
    path.lineWidth = 10;
    
    [[UIColor lightGrayColor] setStroke];
    
    [path stroke];
    
}


@end
