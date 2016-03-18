//
//  Bomb.m
//  FunkyBoom
//
//  Created by Danilo Barros Mendes on 6/17/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "Bomb.h"

@implementation Bomb

-(instancetype)initWithPosition:(CGPoint)position{
    
    if (self = [super initWithTexture:[super generateTextureWithName:@"silverBomb"]]) {
        self.position = position;
        [self setScale:0.5];
        self.physicsBody = [self generatePhysicsBody];
    }
    return self;
}

-(SKPhysicsBody*)generatePhysicsBody{
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.size.width/2];
    
    physicsBody.categoryBitMask = ColliderTypeBomb;
    physicsBody.contactTestBitMask = ColliderTypePlayer | ColliderTypeGround;
    physicsBody.affectedByGravity = YES;
    physicsBody.allowsRotation = YES;
    
    return physicsBody;
    
}

-(void)explode{
    SKAction *wait = [SKAction waitForDuration:2];
    SKAction *remove = [SKAction runBlock:^{
        [self removeFromParent];
    }];
    
    SKAction *doomed = [SKAction sequence:@[wait,remove]];
    
    [self runAction:doomed];
}

@end
