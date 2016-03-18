//
//  PhysicsCategories.h
//  FunkyBoom
//
//  Created by Danilo Barros Mendes on 6/17/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#ifndef FunkyBoom_PhysicsCategories_h
#define FunkyBoom_PhysicsCategories_h

typedef NS_ENUM(NSUInteger, ColliderType){
    
    ColliderTypePlayer = 1 << 0,
    ColliderTypeBomb = 1 << 1,
    ColliderTypeGround = 1 << 2
};


#endif
