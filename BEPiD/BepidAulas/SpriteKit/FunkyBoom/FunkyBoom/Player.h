//
//  Player.h
//  FunkyBoom
//
//  Created by Danilo Barros Mendes on 6/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameObject.h"

@interface Player : GameObject

@property (nonatomic) BOOL flipX;

-(instancetype)initWithPosition:(CGPoint)position;

-(void)setFlipX:(BOOL)flipx;

-(SKAction*) run;
-(SKAction*) idle;
-(SKAction*) attack;

-(void) die;
-(void) punch;

@end
