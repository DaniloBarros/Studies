//
//  ViewController.h
//  Cadastra
//
//  Created by Danilo Barros Mendes on 3/20/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *nome;
@property (nonatomic, weak) IBOutlet UITextField *email;

@property (nonatomic) NSMutableArray *usuarios;


@end
