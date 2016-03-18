//
//  TableView.m
//  BancoDados
//
//  Created by Danilo Barros Mendes on 7/9/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "TableView.h"
#import "DetailView.h"

@implementation TableView

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self populateUsers];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    
    [self populateUsers];
    [self.tableView reloadData];
    
}

-(void)populateUsers{
    
    NSMutableArray *lista = [[NSMutableArray alloc]initWithArray:[AlunoDAO sharedInstance].listaTudo];
    //NSLog(@"%@",lista);
    [self setUsers:lista];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.users.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                 forIndexPath:indexPath];
    
    Usuario *user = [self.users objectAtIndex:[indexPath row]];
    
    
    NSString *nome = user.nome;
    NSString *email = user.email;
    NSString *situacao = user.situacao;
    
    //NSLog(@"%@", nome);
    
    cell.nome.text = nome;
    cell.email.text = email;
    cell.status.text = situacao;
    
    return cell;
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"detail"]) {

        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        
        Usuario *usu = self.users[index.row];
        
        DetailView *view = segue.destinationViewController;
        
        [view setUserId:usu.idUsuario];
        [view setUserNome:usu.nome];
        [view setUserEmail:usu.email];
        [view setUserSenha:usu.senha];
        [view setUserStatus:usu.situacao];
        
    }
    
}

@end
