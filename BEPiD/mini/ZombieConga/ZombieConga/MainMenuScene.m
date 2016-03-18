//
//  MainMenuScene.m
//  ZombieConga
//
//  Created by Danilo Barros Mendes on 4/10/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "MainMenuScene.h"
#import "GameScene.h"


@implementation MainMenuScene

-(id)initWithSize:(CGSize)size{
    
    if(self = [super initWithSize:size]){
        SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"MainMenu@2x"];
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        [bg setScale:1.18];
        [self addChild:bg];
        
    }
    
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    GameScene *gameScene = [[GameScene alloc] initWithSize:self.size];
    SKTransition *transition = [SKTransition doorsOpenHorizontalWithDuration:0.5];
    
    [self.view presentScene:gameScene transition:transition];
}

@end
