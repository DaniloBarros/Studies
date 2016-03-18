//
//  GameState.h
//  FunkyBoom
//
//  Created by Danilo Barros Mendes on 6/18/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameState : NSObject

@property (nonatomic,assign) int score;
@property (nonatomic, assign) int highScore;
@property (nonatomic, assign) unsigned int life;
@property (nonatomic, assign) BOOL replay;

+(instancetype)sharedInstance;
-(void)addScoreToCurrentScore:(int)score;
-(void)loadState;
-(void)saveState;
-(void)resetScore;
-(void)addLifeToCurrentLifes:(int)life;

@end
