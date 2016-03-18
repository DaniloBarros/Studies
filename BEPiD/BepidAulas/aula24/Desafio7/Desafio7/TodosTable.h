//
//  TodosTable.h
//  Desafio7
//
//  Created by Danilo Barros Mendes on 5/20/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodosTable : UITableViewController

@property (nonatomic) NSArray *todosArray;
@property (strong, nonatomic) IBOutlet UITableView *tableTodos;

@property (nonatomic) NSMutableDictionary *todosContatos;

@end
