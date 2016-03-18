//
//  BEPiDPatrimonio.h
//  Aula12
//
//  Created by Danilo Barros Mendes on 3/11/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BEPiDAluno;

@interface BEPiDPatrimonio : NSObject

@property NSString *rotuloPatrimonio;
@property unsigned int valorRevenda;

@property (weak) BEPiDAluno *dono;

@end
