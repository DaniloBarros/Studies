//
//  GameScene.m
//  ZombieConga
//
//  Created by Danilo Barros Mendes on 4/8/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "GameScene.h"
#import "GameOverScene.h"
@import AVFoundation;

#define ARC4RANDOM_MAX  0x100000000

static const float ZOMBIE_MOVE_POINTS_PER_SEC = 120.0;

static const float CATS_MOVE_POINTS_PER_SEC = 120.0;

static const float ZOMBIE_ROTATE_RADIANS_PER_SEC = 4 * M_PI;

static const float BG_POINTS_PER_SEC = 50;

static inline CGFloat ScalarRandomRange(CGFloat min, CGFloat max){
    return floorf( ((double)arc4random() / ARC4RANDOM_MAX) * (max - min)+min);
}

static inline CGPoint CGPointAdd(const CGPoint a, const CGPoint b){
    return CGPointMake(a.x + b.x, a.y + b.y);
}

static inline CGPoint CGPointSubtract(const CGPoint a, const CGPoint b){
    return CGPointMake(a.x - b.x, a.y - b.y);
}

static inline CGPoint CGPointMultiplyScalar(const CGPoint a, const CGFloat x){
    return CGPointMake(a.x * x, a.y * x);
}

static inline CGFloat CGPointLenght(const CGPoint a){
    return sqrt(a.x * a.x + a.y * a.y);
}

static inline CGPoint CGPointNormalize(const CGPoint a){
    CGFloat lenght = CGPointLenght(a);
    return CGPointMake(a.x/lenght, a.y/lenght);
}

static inline CGFloat CGPointToAgle(const CGPoint a){
    return atan2f(a.y, a.x);
}

static inline CGFloat CGPointDistance(const CGPoint a, const CGPoint b){
    return sqrtf(powf(a.x - a.y, 2.0) + powf(b.x - b.y, 2.0));
}

static inline CGFloat ScalarSign(CGFloat a){
    return a >= 0 ? 1 : -1;
}

static inline CGFloat ScalarShortestAngleBetween(const CGFloat a, const CGFloat b){
    
    CGFloat difference = b - a;
    CGFloat angle = fmodf(difference, M_PI * 2);
    
    if (angle >= M_PI) {
        angle -= M_PI * 2;
        
    }else if (angle <= -M_PI){
        angle += M_PI * 2;
    }
    return angle;
}

@implementation GameScene

{
    AVAudioPlayer *_backgroundMusicPlayer;
    
    SKSpriteNode *_zombie;
    SKAction *_zombieAnimation;
    BOOL _invencible;
    
    NSTimeInterval _lastUpdatedTime;
    NSTimeInterval _dt;
    
    CGPoint _velocity;
    
    UITouch *_lastTouch;
    
    SKAction *_catCollisionSound;
    SKAction *_enemyCollisionSound;
    
    int _lives;
    BOOL _gameOver;
    
    
}

-(id)initWithSize:(CGSize)size{
    
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor whiteColor];
        
        [self playBackgroudMusic:@"bgMusic.mp3"];
        
        _zombie = [SKSpriteNode spriteNodeWithImageNamed:@"zombie1"];
        
        for (int i=0; i<2; i++) {
            SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
        
            bg.anchorPoint = CGPointZero;
            bg.position = CGPointMake(i*bg.size.width, 0);
            [bg setScale:1.18];
            bg.name = @"bg";
            [self addChild:bg];
        }
        
        _zombie.position = CGPointMake(100, 100);
        
        [self addChild:_zombie];
        
        NSMutableArray *textures = [NSMutableArray arrayWithCapacity:10];
        
        for (int i=1; i<4; i++) {
            NSString *textureName = [NSString stringWithFormat:@"zombie%d",i];
            SKTexture *texture = [SKTexture textureWithImageNamed:textureName];
            [textures addObject:texture];
        }
        
        for(int i=4; i>1; i--){
            NSString *textureName = [NSString stringWithFormat:@"zombie%d",i];
            SKTexture *texture = [SKTexture textureWithImageNamed:textureName];
            [textures addObject:texture];
        }
        
        _zombieAnimation = [SKAction animateWithTextures:textures timePerFrame:0.1];
        
        _lives = 5;
        _gameOver = NO;
        
        [self runAction:[SKAction repeatActionForever:
                         [SKAction sequence:@[
                            [SKAction performSelector:@selector(spawnEnemy) onTarget:self],
                            [SKAction waitForDuration:2.0]]]]];
        
        [self runAction:[SKAction repeatActionForever:[SKAction sequence:@[[SKAction performSelector:@selector(spawnCats) onTarget:self],[SKAction waitForDuration:1.0]]]]];
        
        _catCollisionSound = [SKAction playSoundFileNamed:@"hitCat.wav"
                                   waitForCompletion:NO];
        
        _enemyCollisionSound = [SKAction playSoundFileNamed:@"hitCatLady.wav"
                                   waitForCompletion:NO];
        
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@"oioioi", @"aaaaa"]];
        
        
    }
    
    return self;
}

-(void)playBackgroudMusic:(NSString *)filename{
    NSError *error;
    NSURL *backgroundMusicURL = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
    
    _backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:&error];
    _backgroundMusicPlayer.numberOfLoops = -1;
    [_backgroundMusicPlayer prepareToPlay];
    [_backgroundMusicPlayer play];
    
}

-(void)moveBg{
    [self enumerateChildNodesWithName:@"bg" usingBlock:^(SKNode *node, BOOL *stop){
        SKSpriteNode *bg = (SKSpriteNode*)node;
        CGPoint bgVelocity = CGPointMake(-BG_POINTS_PER_SEC, 0);
        CGPoint amountToMove = CGPointMultiplyScalar(bgVelocity, _dt);
        bg.position = CGPointAdd(bg.position, amountToMove);
        
        if (bg.position.x <= -bg.size.width) {
            bg.position = CGPointMake(bg.position.x + bg.size.width*2, bg.position.y);
        }
        
    }];
}

-(void)spawnEnemy{
    SKSpriteNode *enemy = [SKSpriteNode spriteNodeWithImageNamed:@"enemy"];
    enemy.name = @"enemy";
    
    enemy.position = CGPointMake(self.size.width + enemy.size.width/2,
                                 ScalarRandomRange(enemy.size.height/2,
                                                   self.size.height - enemy.size.height/2));
    [self addChild:enemy];
    
    
    SKAction *actionMove = [SKAction moveToX: - enemy.size.width/2
                                    duration:5.0];
    SKAction *actionRemove = [SKAction removeFromParent];
    
    [enemy runAction:[SKAction sequence:@[actionMove, actionRemove]]];
    
}

-(void)spawnCats{
    SKSpriteNode *cat = [SKSpriteNode spriteNodeWithImageNamed:@"cat"];
    cat.name = @"cat";
    
    cat.position = CGPointMake(ScalarRandomRange(0, self.size.width),
                               ScalarRandomRange(0, self.size.height));
    
    cat.xScale = 0;
    cat.yScale = 0;
    
    [self addChild:cat];
    
    SKAction *appear = [SKAction scaleTo:1.0 duration:0.5];
    SKAction *leftWiggle = [SKAction rotateByAngle:M_PI_4/2 duration:0.5];
    SKAction *rightWiggle = [leftWiggle reversedAction];
    SKAction *fullWiggle = [SKAction sequence:@[leftWiggle, rightWiggle]];
    SKAction *scaleUp = [SKAction scaleBy:1.2 duration:0.25];
    SKAction *scaleDown = [scaleUp reversedAction];
    SKAction *fullScale = [SKAction sequence:@[scaleUp, scaleDown, scaleUp, scaleDown]];
    SKAction *group = [SKAction group:@[fullScale, fullWiggle]];
    SKAction *groupWait = [SKAction repeatAction:group count:10];
    SKAction *disappear = [SKAction scaleTo:0.0 duration:0.5];
    SKAction *removeFromParent = [SKAction removeFromParent];
    
    [cat runAction:[SKAction sequence:@[appear, groupWait, disappear, removeFromParent]]];
    
}

-(void)moveTrain{
    
    __block CGPoint targetPosition = _zombie.position;
    __block int trainCount = 0;
    
    [self enumerateChildNodesWithName:@"train"
                           usingBlock:^(SKNode *node, BOOL *stop){
                               
                               trainCount++;
                               
                               if (!node.hasActions) {
                                   float actionDuration = 0.3;
                                   
                                   CGPoint offset = CGPointSubtract(targetPosition, node.position);
                                   CGPoint direction = CGPointNormalize(offset);
                                   CGPoint amountToMovePerSec = CGPointMultiplyScalar(direction, CATS_MOVE_POINTS_PER_SEC);
                                   CGPoint amountToMove = CGPointMultiplyScalar(amountToMovePerSec, actionDuration);
                                   
                                   SKAction *moveAction = [SKAction moveByX:amountToMove.x y:amountToMove.y duration:actionDuration];
                                  
                                   [node runAction:moveAction];
                               }
                               targetPosition = node.position;
                           }];
    
    if (trainCount == 30 && !_gameOver) {
        _gameOver = YES;
        
        SKScene *gameOverScene = [[GameOverScene alloc] initWithSize:self.size won:YES];
        
        SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
        [_backgroundMusicPlayer stop];
        [self.view presentScene:gameOverScene transition:reveal];
        
    }
    
    
}

-(void)moveSprite:(SKSpriteNode *)sprite
         velocity:(CGPoint)velocity{
    
    CGPoint amountToMove = CGPointMultiplyScalar(velocity, (float)_dt);
    
    sprite.position = CGPointAdd(sprite.position, amountToMove);
    
    
}

-(void)rotateSprite:(SKSpriteNode *)sprite
             toFace:(CGPoint)direction
 rotateRadiasPerSec:(CGFloat)rotateRadiansPerSec{

    float targetAngle = CGPointToAgle(_velocity);
    float shortest = ScalarShortestAngleBetween(sprite.zRotation, targetAngle);
    float amountToRotate = rotateRadiansPerSec * _dt;
    
    NSLog(@"target %lf Shortest %lf amount %lf",targetAngle, shortest, amountToRotate);
    
    if (ABS(shortest) < amountToRotate) {
        amountToRotate = ABS(shortest);
    }
    
    NSLog(@"amount %lf",amountToRotate);
    NSLog(@"zRotation %lf",ScalarSign(shortest) * amountToRotate);
    
    sprite.zRotation += ScalarSign(shortest) * amountToRotate;

}

-(void)zombieMoveToward:(CGPoint)location{
    
    [self startZombieAnimation];
    
    
    
    //NSLog(@"Location %lf %lf",location.x, location.y);
    CGPoint offset = CGPointSubtract(location, _zombie.position);
    //NSLog(@"offset= (%lf,%lf)",offset.x,offset.y);
    CGPoint direction = CGPointNormalize(offset);
    
    _velocity = CGPointMultiplyScalar(direction, ZOMBIE_MOVE_POINTS_PER_SEC);
    
    //NSLog(@"_velocity = (%lf,%lf)",_velocity.x,_velocity.y);
}

-(void)startZombieAnimation{
    if (![_zombie actionForKey:@"animation"]) {
        [_zombie runAction:[SKAction repeatActionForever:_zombieAnimation] withKey:@"animation"];
    }
}

-(void)stopZombieAction{
    [_zombie removeActionForKey:@"animation"];
}

-(void)blinkSprite:(SKSpriteNode *)sprite
             blinkTimes:(float)blinkTimes
          blinkDuration:(float)blinkDuration{
    
    SKAction *blinkAction = [SKAction customActionWithDuration:blinkDuration
                                                   actionBlock:^(SKNode *node, CGFloat elapsedTime){
                                                       float slice = blinkDuration / blinkTimes;
                                                       float remainder = fmodf(elapsedTime, slice);
                                                       node.hidden = remainder > slice / 2;
                                                   }];
    SKAction *notHidden = [SKAction customActionWithDuration:0
                                                 actionBlock:^(SKNode *node, CGFloat elapsedTime){
                                                     node.hidden = NO;
                                                     _invencible = NO;
                                                 }];
    [sprite runAction:[SKAction sequence:@[blinkAction, notHidden]]];
    
}

-(void)boundCheckPlayer{
    
    CGPoint newPosition = _zombie.position;
    CGPoint newVelocity = _velocity;
    
    CGPoint bottomLeft = CGPointZero;
    CGPoint topRight = CGPointMake(self.size.width,
                                   self.size.height);
    
    if(newPosition.x <= bottomLeft.x){
        newPosition.x = bottomLeft.x;
        newVelocity.x = -newVelocity.x;
    }
    if(newPosition.y <= bottomLeft.y){
        newPosition.y = bottomLeft.y;
        newVelocity.y = -newVelocity.y;
    }
    if(newPosition.x >= topRight.x){
        newPosition.x = topRight.x;
        newVelocity.x = -newVelocity.x;
    }
    if(newPosition.y >= topRight.y){
        newPosition.y = topRight.y;
        newVelocity.y = -newVelocity.y;
    }
    
    _zombie.position = newPosition;
    _velocity = newVelocity;
    
}

-(void)checkCollisions{
    [self enumerateChildNodesWithName:@"cat"
                           usingBlock:^(SKNode *node, BOOL *stop){
                               
                               SKSpriteNode *cat = (SKSpriteNode*) node;
                               
                               if(CGRectIntersectsRect(cat.frame, _zombie.frame)){
                                   //[cat removeFromParent];
                                   
                                   cat.name = @"train";
                                   [cat removeAllActions];
                                   [cat setScale:1];
                                   [self rotateSprite:cat toFace:CGPointZero rotateRadiasPerSec:ZOMBIE_ROTATE_RADIANS_PER_SEC];
                                   [cat runAction:[SKAction colorizeWithColor:[SKColor greenColor]
                                                             colorBlendFactor:1.0
                                                                     duration:0.2]];
                                   _zombie.zPosition = 100;
                                   
                                   [self runAction:_catCollisionSound];
                               }
                           }];
    
    [self enumerateChildNodesWithName:@"enemy"
                           usingBlock:^(SKNode *node, BOOL *stop){
                               SKSpriteNode *enemy = (SKSpriteNode*)node;
                               CGRect smallerFrame = CGRectInset(enemy.frame, 20, 20);
                               
                               if (CGRectIntersectsRect(smallerFrame, _zombie.frame)) {
                                   if (!_invencible) {
                                       [self blinkSprite:_zombie blinkTimes:10.0 blinkDuration:3.0];
                                       _invencible = YES;
                                   
                                   
                                       [self runAction:_enemyCollisionSound];
                                       [self loseCats];
                                       _lives--;
                                    }
                               }
                               
                           }];
    
}

-(void)loseCats{
    
    __block int loseCount = 0;
    
    [self enumerateChildNodesWithName:@"train" usingBlock:^(SKNode *node, BOOL *stop){
        CGPoint randomSpot = node.position;
        randomSpot.x += ScalarRandomRange(-100, 100);
        randomSpot.y += ScalarRandomRange(-100, 100);
        
        node.name=@"";
        [node runAction:[SKAction sequence:@[
                                    [SKAction group:@[
                                        [SKAction rotateByAngle:M_PI * 4 duration:1.0],
                                        [SKAction moveTo:randomSpot duration:1.0],
                                        [SKAction scaleTo: 0 duration: 1.0]
                                        ]],
                                    [SKAction removeFromParent]
                                    ]]];
        loseCount++;
        if (loseCount>=2) {
            *stop = YES;
        }
        
    }];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    [self zombieMoveToward: touchLocation];
    _lastTouch = touch;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    [self zombieMoveToward: touchLocation];
    _lastTouch = touch;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    [self zombieMoveToward: touchLocation];
    _lastTouch = touch;
    
}

-(void)update:(CFTimeInterval)currentTime {
    
    if (_lastUpdatedTime) {
        _dt = currentTime - _lastUpdatedTime;
    }else{
        _dt = 0;
    }
    
    _lastUpdatedTime = currentTime;
    
    CGPoint offset = CGPointSubtract(_zombie.position, [_lastTouch locationInNode:self]);
    
    //if (CGPointLenght(offset) >= (ZOMBIE_MOVE_POINTS_PER_SEC * _dt)) {
    
        [self moveSprite:_zombie velocity:_velocity];
        [self rotateSprite:_zombie toFace:_velocity rotateRadiasPerSec:ZOMBIE_ROTATE_RADIANS_PER_SEC];
    
    //}else{
        
      //  _velocity=CGPointMake(0, 0);
        //[self stopZombieAction];
    
    //}
    
    
    [self boundCheckPlayer];
    [self moveTrain];
    [self moveBg];
    
    if (!_gameOver && _lives <=0) {
        _gameOver = YES;
        
        SKScene *gameOverScene = [[GameOverScene alloc] initWithSize:self.size won:NO];
        
        SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
        [_backgroundMusicPlayer stop];
        [self.view presentScene:gameOverScene transition:reveal];
    }
    
}


-(void)didEvaluateActions{
    
    [self checkCollisions];
}


@end
