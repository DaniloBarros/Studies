//
//  GameLayer.h
//  FunkyBoom
//
//  Created by Danilo Barros Mendes on 6/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Player.h"

@interface GameLayer : SKNode <SKPhysicsContactDelegate>

@property (nonatomic) Player *player;

-(instancetype)initWithSize:(CGSize)size;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)didBeginContact:(SKPhysicsContact *)contact;
-(void)update;

@end
