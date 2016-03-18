//
//  GameScene.m
//  Physics
//
//  Created by Danilo Barros Mendes on 4/14/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "GameScene.h"


#define ARC4RANDOM_MAX 0x100000000

static inline CGFloat ScalarRandomRange(CGFloat min, CGFloat max){
    return floorf(((double) arc4random() / ARC4RANDOM_MAX) * (max-min)+min);
}

@implementation GameScene
{
    SKSpriteNode *_square;
    SKSpriteNode *_circle;
    SKSpriteNode *_triangle;
    
    NSTimeInterval _dt;
    NSTimeInterval _lastUpdateTime;
    NSTimeInterval _timeUntilSwitchWindDirection;
    CGVector _windForce;
    BOOL _blowing;

}

-(id)initWithSize:(CGSize)size{
    
    self = [super initWithSize:size];
    
    if(self){
        
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        
        _square = [SKSpriteNode spriteNodeWithImageNamed:@"square"];
        _square.position = CGPointMake(self.size.width*0.25, self.size.height*0.5);
        
        _square.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_square.size];
        
        [self addChild:_square];
        
        _circle = [SKSpriteNode spriteNodeWithImageNamed:@"circle"];
        _circle.position = CGPointMake(self.size.width*0.5, self.size.height*0.5);
        
        _circle.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:_circle.size.width/2];
        
        [self addChild:_circle];
        
        _triangle = [SKSpriteNode spriteNodeWithImageNamed:@"octagon"];
        _triangle.position = CGPointMake(self.size.width/2 *0.75,
                                         self.size.height/2*0.5);
        
        CGMutablePathRef trianglePath = CGPathCreateMutable();
        
        CGPathMoveToPoint(trianglePath, nil, -_triangle.size.width/4, -_triangle.size.height/2);
        
        CGPathAddLineToPoint(trianglePath, nil, -_triangle.size.width/4, -_triangle.size.height/2);
        CGPathAddLineToPoint(trianglePath, nil, _triangle.size.width/4, -_triangle.size.height/2);
        CGPathAddLineToPoint(trianglePath, nil, _triangle.size.width/2, -_triangle.size.height/4);
        CGPathAddLineToPoint(trianglePath, nil, _triangle.size.width/2, _triangle.size.height/4);
        CGPathAddLineToPoint(trianglePath, nil, _triangle.size.width/4, _triangle.size.height/2);
        CGPathAddLineToPoint(trianglePath, nil, -_triangle.size.width/4, _triangle.size.height/2);
        CGPathAddLineToPoint(trianglePath, nil, -_triangle.size.width/2, _triangle.size.height/4);
        CGPathAddLineToPoint(trianglePath, nil, -_triangle.size.width/2, -_triangle.size.height/4);
        
        _triangle.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:trianglePath];

        
        CGPathRelease(trianglePath);
        
        [self addChild:_triangle];
        
        [self runAction: [SKAction repeatAction:
                          [SKAction sequence:
                           @[[SKAction performSelector:@selector(spawnSand)
                                              onTarget:self],
                             [SKAction waitForDuration:0.02]
                             ]]
                                          count:100]
         ];
        

        
    }
    
    return self;
}

-(void)spawnSand{
    SKSpriteNode *sand = [SKSpriteNode spriteNodeWithImageNamed:@"sand"];
    sand.position = CGPointMake( (float) (arc4random()%(int)self.size.width), self.size.height-sand.size.height );
    sand.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:sand.size.width/2];
    sand.name=@"sand";
    sand.physicsBody.restitution = 0.8;
    sand.physicsBody.density = 20.0;
    [self addChild:sand];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (SKSpriteNode *node in self.children){
    	if([node.name isEqualToString:@"sand"]){
     [node.physicsBody applyImpulse: CGVectorMake(0, arc4random()%50)];
    	}
     }
     
     SKAction *shake = [SKAction moveByX:0 y:10 duration:0.05];
     [self runAction:
    	[SKAction repeatAction:
     [SKAction sequence:@[shake, [shake reversedAction]]]
     count:5]];
    
    /*
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    
    CGPoint offset = CGPointMake(touchLocation.x - _circle.position.x,
                                 touchLocation.y - _circle.position.y);
    CGFloat length = sqrtf(offset.x*offset.x+offset.y*offset.y);
    
    CGPoint direction = CGPointMake(offset.x/length, offset.y/length);
    CGPoint velocity = CGPointMake(direction.x*100,direction.y*100);
    
    CGPoint amountToMove = CGPointMake(velocity.x*_dt, velocity.y*_dt);
    
    _circle.position = CGPointMake(_circle.position.x + amountToMove.x,
                                   _circle.position.y + amountToMove.y);
    */
}

-(void)update:(CFTimeInterval)currentTime {
    
    if (_lastUpdateTime){
        _dt = currentTime - _lastUpdateTime;
    }else{
        _dt = 0;
    }
    _lastUpdateTime = currentTime;
    
    _timeUntilSwitchWindDirection -= _dt;
    
    if (_timeUntilSwitchWindDirection <= 0){
        _timeUntilSwitchWindDirection = ScalarRandomRange(1,5);
        _windForce = CGVectorMake(ScalarRandomRange(-50.0,50.0),0);
    }
    
    for(SKSpriteNode *node in self.children){
        [node.physicsBody applyForce: _windForce];
    }
}

@end
