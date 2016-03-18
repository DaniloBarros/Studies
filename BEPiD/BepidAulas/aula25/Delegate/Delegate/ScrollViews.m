//
//  ScrollViews.m
//  Delegate
//
//  Created by Danilo Barros Mendes on 5/25/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ScrollViews.h"

@interface ScrollViews ()

@end

@implementation ScrollViews

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat screenW = self.view.bounds.size.width;
    
    _scroll1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, screenW-50, self.view.bounds.size.height/2)];
    _scroll1.backgroundColor = [UIColor greenColor];
    _scroll1.contentSize = CGSizeMake(screenW*2, self.view.frame.size.height/2);
    
    _scroll2 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40 + self.view.bounds.size.height/2, screenW-50, self.view.bounds.size.height/2)];
    _scroll2.backgroundColor = [UIColor blueColor];
    _scroll2.contentSize = CGSizeMake(screenW*2, self.view.frame.size.height/2);
    
    
    [self addButtonsToScrollView:_scroll1 qnt:6];
    [self addButtonsToScrollView:self.scroll2 qnt:6];
    
    [self.view addSubview:_scroll1];
    [self.view addSubview:_scroll2];
    
    _scroll1.delegate = self;
    _scroll2.delegate = self;
}

-(void)addButtonsToScrollView:(UIScrollView *)scrollView qnt:(int)qnt{
    float x = 0.0;
    
    CGFloat screenW = self.view.bounds.size.width;
    
    for(int i=0; i<qnt; i++){
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:[NSString stringWithFormat:@"Button %d",i+1]
                forState:UIControlStateNormal];
        button.frame = CGRectMake(x, _scroll1.frame.size.height/4
                                  , screenW/4, _scroll1.frame.size.height/2);
        button.backgroundColor = [UIColor lightGrayColor];
        
        [scrollView addSubview:button];
        
        x+=screenW/4 + 20;
    }
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fim da ScrollView!" message:@"" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Aumentar!", @"Dimunir Maior", nil];
    
    if (_scroll1 == scrollView) {
    
        NSLog(@"Verde");
    
        alert.message = @"ScrollView Verde chegou ao final. Deseja aumentar-lo?";
        
    }else if ([self.scroll2 isEqual:scrollView]) {
        
        NSLog(@"Azul");
        alert.message = @"ScrollView Azul chegou ao final. Deseja aumentar-lo?";
    }
    
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex==1) {
        
        if ([alertView.message containsString:@"Verde"]) {
            CGFloat atualHeight = self.scroll1.frame.size.height;
            
            CGFloat biggerHeight = atualHeight + atualHeight/2;
            CGFloat smallerHeight = atualHeight/2;
            
            [self.scroll1 setFrame:CGRectMake(0, 20, _scroll1.frame.size.width, biggerHeight)];
            [self.scroll2 setFrame:CGRectMake(0, 40 + biggerHeight, _scroll2.frame.size.width, smallerHeight)];
            
        }
        
        if ([alertView.message containsString:@"Azul"]) {
            CGFloat atualHeight = self.scroll2.frame.size.height;
            
            CGFloat biggerHeight = atualHeight + atualHeight/2;
            CGFloat smallerHeight = self.scroll1.frame.size.height/2;
            
            [self.scroll1 setFrame:CGRectMake(0, 20, _scroll1.frame.size.width, smallerHeight)];
            [self.scroll2 setFrame:CGRectMake(0, 40 + smallerHeight, _scroll2.frame.size.width, biggerHeight)];
            
        }
        
    }else if (buttonIndex==2){
        
        CGFloat maior = MAX(self.scroll1.frame.size.height, self.scroll2.frame.size.height);
        
        if (maior == self.scroll1.frame.size.height) {
            CGFloat atualHeight = self.scroll2.frame.size.height;
            
            CGFloat biggerHeight = atualHeight + atualHeight/2;
            CGFloat smallerHeight = self.scroll1.frame.size.height/2;
            
            
            [self.scroll1 setFrame:CGRectMake(0, 20, _scroll1.frame.size.width, smallerHeight)];
            [self.scroll2 setFrame:CGRectMake(0, 40 + smallerHeight, _scroll2.frame.size.width, biggerHeight)];
            
        }else{
            CGFloat atualHeight = self.scroll2.frame.size.height;
            
            CGFloat biggerHeight = atualHeight + atualHeight/2;
            CGFloat smallerHeight = atualHeight/2;
            
            [self.scroll1 setFrame:CGRectMake(0, 20, _scroll1.frame.size.width, biggerHeight)];
            [self.scroll2 setFrame:CGRectMake(0, 40 + biggerHeight, _scroll2.frame.size.width, smallerHeight)];
            
        }
        
        
    }else if (buttonIndex==0){
        [self.scroll1 setFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height/2)];
        [self.scroll2 setFrame:CGRectMake(0, 40 + self.view.bounds.size.height/2, self.view.bounds.size.width, self.view.bounds.size.height/2)];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
