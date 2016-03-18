//
//  GameObject.m
//  FunkyBoom
//
//  Created by Danilo Barros Mendes on 6/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "GameObject.h"

@implementation GameObject

-(SKTexture*)generateTextureWithName:(NSString*)name{
    
    return [SKTexture textureWithImageNamed:name];
}

-(SKPhysicsBody*)generatePhysicsBody{
    return [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(100, 100)];
}

-(void)setBasicAttributes{
    //Override
}

-(void)beginContactWithNode:(SKNode*)node
                withBitmask:(uint32_t)bitmask
                 andContact:(SKPhysicsContact*)contact{
    //Override
}

-(void)endContactWithNode:(SKNode*)node
              withBitmask:(uint32_t)bitmask
               andContact:(SKPhysicsContact*)contact{
    //Override
}


@end
