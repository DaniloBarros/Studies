//
//  GameState.m
//  FunkyBoom
//
//  Created by Danilo Barros Mendes on 6/18/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "GameState.h"

@implementation GameState


-(instancetype)init{
    if(self = [super init]){
        [self initializeAttributes];
        [self loadState];
    }
    
    return self;
}

+(instancetype)sharedInstance{
    static dispatch_once_t pred=0;
    static GameState *_sharedInstance = nil;
    
    dispatch_once(&pred, ^{
        _sharedInstance = [[super alloc] init];
    });
    
    return _sharedInstance;
}

-(void)initializeAttributes{
    self.score=0;
    self.highScore = 0;
    self.life = 5;
    self.replay = NO;
}

-(void)addLifeToCurrentLifes:(int)life{
    self.life += life;
}

-(void)addScoreToCurrentScore:(int)score{
    self.score += score;
}

-(void)resetScore{
    self.score = 0;
}

-(void)loadState{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id score = [defaults objectForKey:@"score"];
    id highScore = [defaults objectForKey:@"highScore"];
    
    if(score)
        self.score = [score intValue];
    if(highScore)
        self.highScore = [highScore intValue];
    
}

-(void)saveState{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.highScore = MAX(self.highScore, self.score);
    
    [defaults setObject:[NSNumber numberWithInt:self.score] forKey:@"score"];
    [defaults setObject:[NSNumber numberWithInt:self.highScore] forKey:@"highScore"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
