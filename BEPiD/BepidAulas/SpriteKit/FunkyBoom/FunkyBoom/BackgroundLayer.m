//
//  BackgroundLayer.m
//  FunkyBoom
//
//  Created by Danilo Barros Mendes on 6/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "BackgroundLayer.h"

@interface BackgroundLayer()

@property (nonatomic) SKSpriteNode *background;

@end

@implementation BackgroundLayer

-(instancetype)initWithSize:(CGSize)size{
    if (self = [super init]) {
        self.background = [SKSpriteNode spriteNodeWithTexture:
                           [SKTexture textureWithImageNamed:@"background"]];
        
        self.background.position = CGPointMake(size.width/2, size.height/2);
        
        self.background.zPosition=-100;
        [self.background setScale:2];
        self.background.texture.filteringMode = SKTextureFilteringNearest;
        
        [self addChild:self.background];
        
    }
    
    return self;
}


@end
