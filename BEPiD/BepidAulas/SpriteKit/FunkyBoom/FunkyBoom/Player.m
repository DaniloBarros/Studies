//
//  Player.m
//  FunkyBoom
//
//  Created by Danilo Barros Mendes on 6/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "Player.h"

@interface Player()

@property (nonatomic) SKAction *runState;
@property (nonatomic) SKAction *attackState;
@property (nonatomic) SKAction *idleState;

@end

@implementation Player

-(instancetype)initWithPosition:(CGPoint)position{
    if (self = [super initWithTexture:[super generateTextureWithName:@"idle1"]]) {
        self.position = position;
        [self setScale:0.5];
        
        [self initializeAnimations];
        self.physicsBody = [self generatePhysicsBody];
        
    }
    return self;
}

#pragma mark -Animations


-(void) initializeAnimations{
    self.idleState = [self loadIdleAnimation];
    self.runState = [self loadRunAnimation];
    self.attackState = [self loadAttackAnimation];
}

-(SKAction*) loadIdleAnimation{
    NSMutableArray *idleTextures = [NSMutableArray array];
    
    for(int i=1; i<=3; i++){
        [idleTextures addObject:
         [SKTexture textureWithImageNamed:
          [NSString stringWithFormat:@"idle%d",i]]];
    }
    
    SKAction *idle = [SKAction animateWithTextures:idleTextures timePerFrame:0.25];
    
    return idle;
    
}

-(SKAction*) loadRunAnimation{
    NSMutableArray *runTextures = [NSMutableArray array];
    
    for (int i=1; i<=4; i++) {
        [runTextures addObject:
         [SKTexture textureWithImageNamed:
          [NSString stringWithFormat:@"walking%d",i]]];
    }
    
    SKAction *run = [SKAction animateWithTextures:runTextures timePerFrame:0.2];
    
    return run;
}

-(SKAction*)loadAttackAnimation{
    NSMutableArray *attackTextures = [NSMutableArray array];
    
    for (int i=2; i<=5; i++) {
        [attackTextures addObject:
         [SKTexture textureWithImageNamed:
          [NSString stringWithFormat:@"attacking%d",i]]];
    }
    
    SKAction *attack = [SKAction animateWithTextures:attackTextures timePerFrame:0.1];
    
    return attack;
}

-(SKAction*) idle{
    SKAction *repeatForever = [SKAction repeatActionForever:self.idleState];
    
    return repeatForever;
}

-(SKAction*)run{
    SKAction *run = [SKAction repeatActionForever:self.runState];
    [self removeActionForKey:@"currentAnimation"];
    return run;
}

-(SKAction*)attack{
    SKAction *attack = [self attackState];
    [self removeActionForKey:@"currentAnimation"];
    return attack;
}

#pragma mark -Physics

-(SKPhysicsBody*)generatePhysicsBody{
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
    physicsBody.categoryBitMask = ColliderTypePlayer;
    physicsBody.contactTestBitMask = ColliderTypeBomb;
    physicsBody.affectedByGravity = NO;
    physicsBody.allowsRotation = NO;
    physicsBody.mass = 20000;
    
    return physicsBody;
}

-(void)setFlipX:(BOOL)flipx{
    if (flipx) {
        self.xScale = -fabs(self.xScale);
    }else{
        self.xScale = fabs(self.xScale);
    }
    
    _flipX = flipx;
}

@end
