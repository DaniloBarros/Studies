//
//  GameOverScene.m
//  ZombieConga
//
//  Created by Danilo Barros Mendes on 4/10/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "GameOverScene.h"
#import "GameScene.h"


@implementation GameOverScene

-(id)initWithSize:(CGSize)size won:(BOOL)won{
    if (self = [super initWithSize:size]) {
        SKSpriteNode *bg;
        if (won) {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouWin"];
            [self runAction:[SKAction sequence:@[
                                [SKAction waitForDuration:0.1],
                                [SKAction playSoundFileNamed:@"win.wav"
                                           waitForCompletion:NO]]
                             ]];
            
        }else{
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouLose.png"];
            [self runAction:[SKAction sequence:@[
                                                 [SKAction waitForDuration:0.1],
                                                 [SKAction playSoundFileNamed:@"lose.wav"
                                                            waitForCompletion:NO]]
                             ]];
            
        }
        
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bg];
        
        SKAction *wait = [SKAction waitForDuration:3.0];
        SKAction *block = [SKAction runBlock:^{
            GameScene *gameScene = [[GameScene alloc] initWithSize:self.size];
            
            SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
            
            [self.view presentScene:gameScene transition:reveal];
            
        }];
        [self runAction:[SKAction sequence:@[wait,block]]];
    
    }
    
    
    
    return self;
}

@end
