//
//  BEPiDAluno.h
//  Aula12
//
//  Created by Danilo Barros Mendes on 3/11/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BEPiDPatrimonio;

@interface BEPiDAluno : NSObject

@property NSString* nomealuno;
@property unsigned int matriculaAluno;

-(void)adicionarPatrimonio:(BEPiDPatrimonio *)p;
-(unsigned int)totalPatrimonio;

@end
