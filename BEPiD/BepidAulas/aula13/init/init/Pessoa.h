//
//  Pessoa.h
//  init
//
//  Created by Danilo Barros Mendes on 3/12/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pessoa : NSObject

@property (nonatomic) NSString *nome;
@property (nonatomic, readonly) NSDate *dataCriacao;

-(instancetype) initWithName: (NSString *)name;

@end
