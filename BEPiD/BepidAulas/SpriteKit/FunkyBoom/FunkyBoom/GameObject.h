//
//  GameObject.h
//  FunkyBoom
//
//  Created by Danilo Barros Mendes on 6/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "PhysicsCategories.h"

@interface GameObject : SKSpriteNode

-(SKTexture*)generateTextureWithName:(NSString*)name;
-(SKPhysicsBody*)generatePhysicsBody;
-(void)setBasicAttributes;
-(void)beginContactWithNode:(SKNode*)node
                withBitmask:(uint32_t)bitmask
                 andContact:(SKPhysicsContact*)contact;
-(void)endContactWithNode:(SKNode*)node
              withBitmask:(uint32_t)bitmask
               andContact:(SKPhysicsContact*)contact;

@end
