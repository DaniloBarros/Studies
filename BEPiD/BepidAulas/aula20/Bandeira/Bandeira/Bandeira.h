//
//  Bandeira.h
//  Bandeira
//
//  Created by Danilo Barros Mendes on 3/26/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Elipse.h"
#import "Estrela.h"
#import "Retangulo.h"

@interface Bandeira : UIViewController

@property (nonatomic) Retangulo *rect;
@property (nonatomic) Elipse *elip;
@property (nonatomic) Estrela *estr;

@property (nonatomic) CGRect fundo;

@end
