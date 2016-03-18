//
//  GameScene.m
//  FunkyBoom
//
//  Created by Danilo Barros Mendes on 6/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "GameScene.h"
#import "Player.h"
#import "GameState.h"

@implementation GameScene

-(instancetype)initWithSize:(CGSize)size{
    
    if (self=[super initWithSize:size]) {
        
        self.gameLayer =[[GameLayer alloc] initWithSize:size];
        self.backgroundLayer = [[BackgroundLayer alloc] initWithSize:size];
        self.hudLayer = [[HudLayer alloc] initWithSize:size];
        
        [self addChild:self.gameLayer];
        [self addChild:self.hudLayer];
        [self addChild:self.backgroundLayer];
        
        self.physicsWorld.contactDelegate = self;
        self.physicsWorld.gravity = CGVectorMake(0, -5.0);
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!self.gameLayer.paused) {
        [self.gameLayer touchesBegan:touches withEvent:event];
    }
    [self.hudLayer touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.gameLayer touchesMoved:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.gameLayer touchesEnded:touches withEvent:event];
}


#pragma mark SKPhysicsContact

-(void)didBeginContact:(SKPhysicsContact *)contact{
    [self.gameLayer didBeginContact:contact];
}

-(void)update:(CFTimeInterval)currentTime {
    
    self.hudLayer.scoreLabel.text = [NSString stringWithFormat:@"%d", [GameState sharedInstance].score];
    self.hudLayer.lifeNode.text = [NSString stringWithFormat:@"Lifes: %d", [GameState sharedInstance].life];
    
    [self.gameLayer update];
    
    if ([GameState sharedInstance].life<=0) {
        [GameState sharedInstance].life = 0;
        [self.gameLayer setPaused:YES];
        
        if(![self.hudLayer gameOver]){
            [self.hudLayer showGameOver:self.size];
        }
        
    }
    
    if ([GameState sharedInstance].replay) {
        [GameState sharedInstance].replay = NO;
        [[GameState sharedInstance] setLife:5];
        [[GameState sharedInstance] resetScore];
        
        [self.hudLayer removeGameOver];
        
        [self.gameLayer setPaused:NO];
        //self.gameLayer = [self.gameLayer initWithSize:self.size];
    }
     
    
    
}

@end
