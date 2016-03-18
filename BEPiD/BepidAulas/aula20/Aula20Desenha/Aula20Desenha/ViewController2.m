//
//  ViewController2.m
//  Aula20Desenha
//
//  Created by Danilo Barros Mendes on 3/23/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@property (nonatomic, weak) IBOutlet UIButton *volta;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*CGRect frame = CGRectMake(_x, _y, _comprimento, _largura);

    if (_desenhaRetangulo) {
        
        _rect = [[Retangulo alloc] initWithFrame:frame];
        _rect.backgroundColor = _cor;
        
        [self.view addSubview:_rect];
    
    }else{
        _elip = [[Elipse alloc] initWithFrame:frame eCor:_cor];
        [self.view addSubview:_elip];
    }*/
    
    for (int i=0; i < [self.subviews count]; i++) {
        
        [self.view addSubview:[self subviews][i]];
    
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view layoutSubviews];
    
    [self.view bringSubviewToFront:_volta];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)voltarTela:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
