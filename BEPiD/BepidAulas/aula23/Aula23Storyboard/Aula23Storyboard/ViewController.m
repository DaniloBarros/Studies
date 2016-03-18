//
//  ViewController.m
//  Aula23Storyboard
//
//  Created by Danilo Barros Mendes on 5/11/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController.h"
#import "DetailsViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *numbers;

@property (nonatomic) NSString *string;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Minha Primeira TV";
    
    self.numbers = [[NSMutableArray alloc]  initWithObjects:@"Um", @"Dois", @"Tres",
                    @"Quatro", @"Cinco", @"Seis",
                    @"Sete", @"Oito", @"Nove",
                    @"Dez", nil];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.numbers.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:cellIdentifier];
    
    cell.textLabel.text = [self.numbers objectAtIndex:indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _string = [self.numbers objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"details" sender:self];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"details"]) {
        
        DetailsViewController *detailsView = segue.destinationViewController;
        
        [detailsView setDetails:_string];
        NSLog(@"oioi");
    }else{
        DetailsViewController *detailsView = segue.destinationViewController;
        
        [detailsView setDetails:@"Null"];
        
        NSLog(@"eiei");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
