//
//  CustomTableViewCell.h
//  TableViewCell
//
//  Created by Danilo Barros Mendes on 5/13/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *primeiroNome;
@property (weak, nonatomic) IBOutlet UILabel *segundoNome;

@property (weak, nonatomic) IBOutlet UIImageView *customImagem;

@property (nonatomic) NSString *telefone;

@end
