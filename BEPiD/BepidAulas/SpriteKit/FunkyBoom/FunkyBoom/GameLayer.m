//
//  GameLayer.m
//  FunkyBoom
//
//  Created by Danilo Barros Mendes on 6/16/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "GameLayer.h"
#import "Player.h"
#import "Bomb.h"
#import "GameState.h"

@interface GameLayer()

@property (nonatomic) SKEmitterNode *hitParticle;
@property (nonatomic) AVAudioPlayer *musicPlayer;
@property (nonatomic) SKSpriteNode *ground;
@property (nonatomic) double lastBombWait;
@property (nonatomic) double bombWait;

@end

@implementation GameLayer

-(instancetype)initWithSize:(CGSize)size{
    if (self = [super init]) {
        
        [self playMusic];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"HitParticle" ofType:@"sks"];
        self.hitParticle = (SKEmitterNode*)[NSKeyedUnarchiver unarchiveObjectWithFile:path];

        
        self.player = [[Player alloc] initWithPosition:CGPointMake(size.width/2, size.height*0.25)];
        [self addChild:self.player];
        
        [self.player runAction:[self.player idle] withKey:@"currentAnimation"];
        
        
        [self initializeGround:size];
        [self addChild:self.ground];
        self.lastBombWait = 1.5;
        self.bombWait = 1.5;
        [self bombGenerator];
        
    }
    
    return self;
}

-(void)initializeGround:(CGSize)size{
    
    CGRect groundRect = CGRectMake(size.width/2, self.player.position.y - 20, size.width, 40);
    self.ground = [[SKSpriteNode alloc] initWithColor:nil size:groundRect.size];
    self.ground.position = CGPointMake(groundRect.origin.x, groundRect.origin.y);
    
    SKPhysicsBody *groundPhysicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.ground.size];
    
    groundPhysicsBody.categoryBitMask = ColliderTypeGround;
    groundPhysicsBody.contactTestBitMask = ColliderTypeBomb;
    
    groundPhysicsBody.affectedByGravity = NO;
    groundPhysicsBody.allowsRotation = NO;
    
    groundPhysicsBody.mass = 50000;
    
    self.ground.physicsBody = groundPhysicsBody;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    [self.player removeActionForKey:@"currentAnimation"];
    
    
    if (location.x < self.player.position.x ){
        [self.player setFlipX:YES];
    }else{
        [self.player setFlipX:NO];
    }
    
    SKAction *movement = [SKAction moveToX:location.x duration:0.5];
    
    SKAction *completion = [SKAction runBlock:^{
        [self.player runAction:[self.player idle] withKey:@"currentAnimation"];
    }];
    
    SKAction *sequenceWalk = [SKAction sequence:@[movement,completion]];
    
    [self.player runAction:[self.player run] withKey:@"run"];
    
    [self.player runAction:sequenceWalk withKey:@"currentAnimation"];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
   
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    
    //[self.player removeActionForKey:@"idle"];
    
    SKAction *wait = [SKAction waitForDuration:0.27];
    
    if ([self.player actionForKey:@"waiting"]) {
        
    }else{
        //[self.player removeActionForKey:@"currentAnimation"];
        
        if (location.x < self.player.position.x ){
            [self.player setFlipX:YES];
        }else{
            [self.player setFlipX:NO];
        }
        
        SKAction *movement = [SKAction moveToX:location.x duration:0.5];
        
        SKAction *completion = [SKAction runBlock:^{
            [self.player runAction:[self.player idle] withKey:@"currentAnimation"];
        }];
        
        SKAction *sequenceWalk = [SKAction sequence:@[movement,completion]];
        
        SKAction *group = [SKAction group:@[[self.player run], sequenceWalk]];
        
        [self.player runAction:group withKey:@"currentAnimation"];
        
        //[self.player runAction:[self.player run] withKey:@"run"];
        
        //[self.player runAction:sequenceWalk withKey:@"moveAction"];
        

        [self.player runAction:wait withKey:@"waiting"];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

#pragma mark BombGenerator

-(void) bombGenerator{
    [self removeActionForKey:@"bombGenerator"];
    SKAction *generator = [SKAction performSelector:@selector(createBomb) onTarget:self];
    SKAction *wait = [SKAction waitForDuration:self.bombWait];
    SKAction *sequence = [SKAction sequence:@[generator, wait]];
    
    SKAction *repeatActionForever = [SKAction repeatActionForever:sequence];
    
    [self runAction:repeatActionForever withKey:@"bombGenerator"];
    
}

-(void)createBomb{
    Bomb *bomb = [[Bomb alloc] initWithPosition:[self xPositionRandomizer]];
    
    [bomb explode];
    
    [self addChild:bomb];
}

-(CGPoint)xPositionRandomizer{
    CGPoint randomPosition = CGPointMake(1+arc4random() % ((int)CGRectGetMaxX(self.scene.frame)-1),
                                         CGRectGetMaxY(self.scene.frame));
    
    return randomPosition;
}

-(void)calculateBombTime{
    
    if ([GameState sharedInstance].score < 15) {
        self.bombWait = 1.5;
    }else if ([GameState sharedInstance].score < 45) {
        self.bombWait = 1.1;
    }else if ([GameState sharedInstance].score < 60) {
        self.bombWait = 0.8;
    }if ([GameState sharedInstance].score < 80) {
        self.bombWait = 0.6;
    }else{
        self.bombWait = 0.5;
    }

    
}


#pragma mark SKPhysicsContact

-(void)didBeginContact:(SKPhysicsContact *)contact{
    if ([contact.bodyA.node isKindOfClass:[Player class]] &&
        [contact.bodyB.node isKindOfClass:[Bomb class]]) {
        
        /*
        [contact.bodyA.node runAction:[(Player*)contact.bodyA.node attack] completion:^{
            [(Player*)contact.bodyA.node idle];
        }];
        */
        SKAction *attackSequence = [SKAction sequence:@[[self.player attack],[self.player idle]]];
        [self.player runAction:attackSequence withKey:@"currentAnimation"];
        
        [contact.bodyB.node.physicsBody applyImpulse:CGVectorMake(-100, 300)];
        
        [[GameState sharedInstance] addScoreToCurrentScore:1];
        
        SKEmitterNode *emitter = [self getHitParticleAtPosition:contact.contactPoint];
        [self addChild:emitter];
        
        SKAction *som = [SKAction playSoundFileNamed:@"hitSound.wav" waitForCompletion:NO];
        [self runAction:som];
        SKAction *bombAway = [SKAction playSoundFileNamed:@"bombAway.wav" waitForCompletion:NO];
        [self runAction:bombAway];
        
    }else if([contact.bodyA.node isEqual:self.ground] && [contact.bodyB.node isKindOfClass:[Bomb class]]){
        
        [[GameState sharedInstance] addLifeToCurrentLifes:-1];
        
        [contact.bodyB.node.physicsBody applyImpulse:CGVectorMake(100, 300) ];
    }
}

#pragma mark ParticleFactory
-(SKEmitterNode*)getHitParticleAtPosition:(CGPoint)position{
    SKEmitterNode *emitter = [self.hitParticle copy];
    emitter.position = position;
    
    SKAction *wait = [SKAction waitForDuration:2];
    [emitter runAction:wait completion:^{
        [emitter removeFromParent];
    }];
    
    return emitter;
}

#pragma mark Audio

-(void)playMusic{
    NSURL *musicURL = [[NSBundle mainBundle] URLForResource:@"music" withExtension:@"mp3"];
    self.musicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL error:nil];
    self.musicPlayer.numberOfLoops = -1;
    [self.musicPlayer prepareToPlay];
    [self.musicPlayer play];
}

#pragma mark Update

-(void)update{
    
    //[self calculateBombTime];
    
    
}

@end
