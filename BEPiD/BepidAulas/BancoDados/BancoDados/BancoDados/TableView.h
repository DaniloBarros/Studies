//
//  TableView.h
//  BancoDados
//
//  Created by Danilo Barros Mendes on 7/9/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlunoDAO.h"
#import "Cell.h"

@interface TableView : UITableViewController

@property (nonatomic) NSMutableArray *users;

@end
