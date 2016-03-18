//
//  HudLayer.m
//  FunkyBoom
//
//  Created by Danilo Barros Mendes on 6/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "HudLayer.h"
#import "GameState.h"

@implementation HudLayer


-(instancetype)initWithSize:(CGSize)size{
    if (self = [super init]) {
        self.scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"5x5 Pixel"];
        self.scoreLabel.fontSize = 32;
        self.scoreLabel.fontColor = [SKColor whiteColor];
        self.scoreLabel.position = CGPointMake(size.width*0.5, size.height*0.9);
        self.scoreLabel.text = @"0";
        
        self.lifeNode = [SKLabelNode labelNodeWithFontNamed:@"5x5 Pixel"];
        self.lifeNode.fontSize = 32;
        self.lifeNode.text = [NSString stringWithFormat:@"Lifes: 5"];
        self.lifeNode.position = CGPointMake(self.lifeNode.frame.size.width, size.height*0.9);
        [self addChild:self.lifeNode];
        [self addChild:self.scoreLabel];
    }
    
    return self;
}

-(void)showGameOver:(CGSize)size{
    
    _gameOver = [[SKLabelNode alloc] initWithFontNamed:@"5x5 Pixel"];
    _gameOver.fontSize = 48;
    _gameOver.fontColor = [SKColor redColor];
    _gameOver.text = @"GAME OVER";
    _gameOver.name = @"gameOver";
    _gameOver.position = CGPointMake(size.width/2, size.height/2);
    
    SKAction *blink = [SKAction scaleBy:2 duration:0.3];
    
    SKAction *sequence = [SKAction sequence:@[blink, [blink reversedAction]]];
    
    SKAction *repeat = [SKAction repeatAction:sequence count:3];
    
    [self.gameOver runAction:repeat];
    
    [self addChild:self.gameOver];
    
}

-(void)removeGameOver{
    [_gameOver removeFromParent];
    _gameOver=nil;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint position = [touch locationInNode:self];
    
    SKSpriteNode *node = (SKSpriteNode*)[self nodeAtPoint:position];
    
    if([node.name isEqualToString:@"gameOver"]){
        [GameState sharedInstance].replay = YES;
    }
    
}

@end
