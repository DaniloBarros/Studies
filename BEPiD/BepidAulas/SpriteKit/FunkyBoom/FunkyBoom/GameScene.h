//
//  GameScene.h
//  FunkyBoom
//

//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameLayer.h"
#import "BackgroundLayer.h"
#import "HudLayer.h"

@interface GameScene : SKScene <SKPhysicsContactDelegate>

@property (nonatomic) GameLayer *gameLayer;
@property (nonatomic) BackgroundLayer *backgroundLayer;
@property (nonatomic) HudLayer *hudLayer;

@end
