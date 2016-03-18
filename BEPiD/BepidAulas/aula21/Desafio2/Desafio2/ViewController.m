//
//  ViewController.m
//  Desafio2
//
//  Created by Danilo Barros Mendes on 3/25/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize scroll, page;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *cores = [NSArray arrayWithObjects:[UIColor greenColor], [UIColor blueColor], [UIColor yellowColor], [UIColor purpleColor], nil];
    
    for (int i=0; i< cores.count; i++) {
        CGRect frame;
        frame.origin.x = self.scroll.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scroll.frame.size;
        
        UIView *subview = [[UIView alloc] initWithFrame:frame];
        subview.backgroundColor = [cores objectAtIndex:i];
        [self.scroll addSubview:subview];
        
        //[subview release];
    }
    self.scroll.contentSize = CGSizeMake(self.scroll.frame.size.width*cores.count, self.scroll.frame.size.height);
    
    pageControlBeingUsed = NO;
    self.page.currentPage = 0;
    self.page.numberOfPages = cores.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    //if (!pageControlBeingUsed) {
        CGFloat pageWidth = self.scroll.frame.size.width;
        
        int pag = floor((self.scroll.contentOffset.x - pageWidth / 2 ) / pageWidth)+1;
        
        self.page.currentPage = pag;
        NSLog(@"OIOI");
        [self.page setTag:pag];
    //}
    
}

- (IBAction)changePage:(UIPageControl *)sender {
    
    CGRect frame;
    frame.origin.x = self.scroll.frame.size.width * self.page.currentPage;
    frame.origin.y = 0;
    frame.size = self.scroll.frame.size;
    
    [self.scroll scrollRectToVisible:frame animated:YES];
    CGFloat pageWidth = self.scroll.frame.size.width;
    
    int pag = floor((self.scroll.contentOffset.x - pageWidth / 2 ) / pageWidth)+1;
    
    [self.page setTag:pag];
    
    pageControlBeingUsed = YES;
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"OEOE");
    pageControlBeingUsed = NO;
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    pageControlBeingUsed = NO;
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
