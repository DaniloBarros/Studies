//
//  Bomb.h
//  FunkyBoom
//
//  Created by Danilo Barros Mendes on 6/17/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "GameObject.h"

@interface Bomb : GameObject

-(instancetype)initWithPosition:(CGPoint)position;
-(void)explode;

@end
