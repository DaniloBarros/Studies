//
//  AlunoCell.h
//  Desafio7
//
//  Created by Danilo Barros Mendes on 5/20/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlunoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *kit;

@property (nonatomic) NSString *nascimento;

@end
