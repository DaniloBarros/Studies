//
//  HudLayer.h
//  FunkyBoom
//
//  Created by Danilo Barros Mendes on 6/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface HudLayer : SKNode

@property (nonatomic) SKLabelNode *scoreLabel;
@property (nonatomic) SKLabelNode *lifeNode;
@property (nonatomic) SKLabelNode *gameOver;

-(instancetype)initWithSize:(CGSize)size;
-(void)showGameOver:(CGSize)size;
-(void)removeGameOver;

@end
