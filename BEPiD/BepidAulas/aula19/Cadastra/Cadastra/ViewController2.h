//
//  ViewController2.h
//  Cadastra
//
//  Created by Danilo Barros Mendes on 3/20/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController

@property (nonatomic) NSMutableArray *usuarios;
@property (nonatomic, weak) IBOutlet UITableView *tabela;

-(void)lerArquivo;

@end
