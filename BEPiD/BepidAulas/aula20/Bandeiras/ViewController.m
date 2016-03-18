//
//  ViewController.m
//  Bandeiras
//
//  Created by Danilo Barros Mendes on 3/26/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageControll = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                        navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                      options:nil];
    
    self.pageControll.dataSource = self;
    //self.pageControll.delegate = self;
    
    [[self.pageControll view] setFrame:[[self view] bounds]];
    
    Japao *firstView = [self viewControllerAtIndex:0];
    
    NSArray *views = [NSArray arrayWithObject:firstView];
    
    [self.pageControll setViewControllers:views direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageControll];
    [[self view] addSubview:[self.pageControll view]];
    [self.pageControll didMoveToParentViewController:self];
    
}

-(UIView*) viewControllerAtIndex:(NSInteger)index{
    
    ChildController *child = [[ChildController alloc] init];
    child.index = index;
    return child;
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    NSUInteger index = [(ChildController *) viewController index];
    
    if(index==0){
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

-(UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    
    NSUInteger index = [(ChildController *) viewController index];
    
    if(index==4){
        return nil;
    }
    
    index++;
    
    return [self viewControllerAtIndex:index];
    
    
}

-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    return 5;
}

-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController{
    return 0;
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
