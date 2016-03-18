//
//  ContatosTableViewController.m
//  TableViewCell
//
//  Created by Danilo Barros Mendes on 5/13/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ContatosTableViewController.h"
#import "CustomTableViewCell.h"
#import "DetailsViewViewController.h"

@interface ContatosTableViewController ()

@end

@implementation ContatosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"contacts" ofType:@"plist"];
    
    self.contatos = [NSArray arrayWithContentsOfFile:path];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self contatos].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"Cell";
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    
    self.dicionarioContato = self.contatos[indexPath.row];
    
    NSString *primeiroNome = self.dicionarioContato[@"firstName"];
    NSString *segundoNome = self.dicionarioContato[@"lastName"];
    NSString *imagem = self.dicionarioContato[@"imageName"];
    NSString *telefone = self.dicionarioContato[@"telefone"];
    
    UIImage *image = [UIImage imageNamed:imagem];
    
    cell.primeiroNome.text = [NSString stringWithFormat:@"%@", primeiroNome];
    cell.segundoNome.text = segundoNome;
    cell.customImagem.image = image;
    cell.telefone = telefone;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/




// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"details"]) {
        
       NSIndexPath *index = [self.tableView indexPathForSelectedRow];
       
        self.dicionarioContato = self.contatos[index.row];
        NSString *telefone = self.dicionarioContato[@"telefone"];
        NSLog(@"%@", segue.destinationViewController);
        DetailsViewViewController *view = segue.destinationViewController;
        
        [view setTel:telefone];
        
    }
    
}

@end
