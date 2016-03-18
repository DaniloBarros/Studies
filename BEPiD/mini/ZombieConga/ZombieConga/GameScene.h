//
//  GameScene.h
//  ZombieConga
//

//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene

-(void)moveSprite:(SKSpriteNode *)sprite velocity:(CGPoint)velocity;
-(void)zombieMoveToward:(CGPoint)location;
-(void)boundCheckPlayer;
-(void)rotateSprite:(SKSpriteNode *)sprite
             toFace:(CGPoint)direction
 rotateRadiasPerSec:(CGFloat)rotateRadiansPerSec;
-(void)spawnEnemy;
-(void)startZombieAnimation;
-(void)stopZombieAction;
-(void)spawnCats;
-(void)checkCollisions;
-(void)blinkSprite:(SKSpriteNode *)sprite
        blinkTimes:(float)blinkTimes
     blinkDuration:(float)blinkDuration;
-(void)moveTrain;
-(void)loseCats;
-(void)playBackgroudMusic:(NSString *)filename;
-(void)moveBg;

@end
