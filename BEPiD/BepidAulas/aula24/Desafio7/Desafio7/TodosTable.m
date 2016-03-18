//
//  TodosTable.m
//  Desafio7
//
//  Created by Danilo Barros Mendes on 5/20/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "TodosTable.h"
#import "AlunoCell.h"
#import "ViewController.h"

@interface TodosTable ()

@property (nonatomic) NSString *path;

@end

@implementation TodosTable


-(void)viewDidAppear:(BOOL)animated{
    [_tableTodos reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableTodos.delegate = self;
    _tableTodos.dataSource = self;
    
    self.title = @"Todos";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addContato:)];
    
    if ([self didReceivedPath:@"contacts.plist"]) {
    
        self.todosArray = [NSArray arrayWithContentsOfFile:_path];
    
    }else{

        _path = [self copyFileToDocumentDirectory:@"contacts.plist"];
        self.todosArray = [NSArray arrayWithContentsOfFile:_path];
        
//        NSMutableDictionary *dc = [NSMutableDictionary dictionary];
//        
//        [dc setValue:@"Aluno" forKey:@"tipo"];
//        [dc setValue:@"000" forKey:@"kit"];
//        [dc setValue:@"Teste" forKey:@"nome"];
//        [dc setValue:@"01/01/2000" forKey:@"nascimento"];
//        
//        UIImage *defaultImage = [UIImage imageNamed:@"user-default.png"];
//        NSData *imgData = UIImagePNGRepresentation(defaultImage);
//        
//        [dc setValue:imgData forKey:@"image"];
//        
//        NSArray *array = [[NSArray alloc] initWithObjects:dc, nil];
//        
//       BOOL sucess = [array writeToFile:[[NSBundle mainBundle]pathForResource:@"contacts" ofType:@"plist"] atomically:YES];
//        if (sucess) {
//            NSLog(@"sucess!");
//        }else{
//            NSLog(@"Failure!");
//        }
    }
    
    
    
    NSLog(@"%@ %ld", _todosArray, [_todosArray count]);
}

-(void)addContato:(id)sender{
    [self performSegueWithIdentifier:@"add" sender:sender];
}

- (NSString *)copyFileToDocumentDirectory:(NSString *)fileName {
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask,
                                                         YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString *documentDirPath = [documentsDir
                                 stringByAppendingPathComponent:fileName];
    
    NSArray *file = [fileName componentsSeparatedByString:@"."];
    NSString *filePath = [[NSBundle mainBundle]
                          pathForResource:[file objectAtIndex:0]
                          ofType:[file lastObject]];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL success = [fileManager fileExistsAtPath:documentDirPath];
    
    if (!success) {
        success = [fileManager copyItemAtPath:filePath
                                       toPath:documentDirPath
                                        error:&error];
        if (!success) {
            NSAssert1(0, @"Failed to create writable txt file file with message \
                      '%@'.", [error localizedDescription]);
        }
    }
    
    return documentDirPath;
}

-(BOOL)didReceivedPath:(NSString*)fileName{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    _path = [documentsDirectory stringByAppendingPathComponent:fileName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL exists = [fileManager fileExistsAtPath:_path];
    
    return exists;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    // Return the number of sections.
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    self.todosArray = [NSArray arrayWithContentsOfFile:_path];
    
    
    //NSLog(@"Rows %@ %ld", _todosArray, [_todosArray count]);
    return [self.todosArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifierAluno = @"Aluno";
    AlunoCell *cell = (AlunoCell *)[tableView dequeueReusableCellWithIdentifier:identifierAluno forIndexPath:indexPath];
    
    
    self.todosArray = [NSArray arrayWithContentsOfFile:_path];
    UIImage *defaultImage = [UIImage imageNamed:@"user-default.png"];
    
    self.todosContatos = self.todosArray[indexPath.row];
    
    if ([self.todosContatos[@"tipo"] isEqualToString:@"Aluno"]) {
        
        cell.nome.text = self.todosContatos[@"nome"];
        cell.kit.text = [NSString stringWithFormat:@"Numero: %@",self.todosContatos[@"kit"]];
        cell.nascimento = self.todosContatos[@"nascimento"];

        if ([self.todosContatos[@"image"] isEqual:[NSData data]]) {

            cell.image.image = defaultImage;
        }else{
            
            cell.image.image = [UIImage imageWithData:self.todosContatos[@"image"]];
        }
        
    }else{
        
        NSString *nome = self.todosContatos[@"nome"];
        cell.nome.text = nome;
        cell.nascimento = self.todosContatos[@"nascimento"];
        cell.kit.hidden = YES;
        
        if ([self.todosContatos[@"image"] isEqual:[NSData data]]) {
            cell.image.image = defaultImage;
        }else{
            cell.image.image = [UIImage
                                imageWithData:self.todosContatos[@"image"]];
        }
    }
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"add"]) {
        
        ViewController *view = segue.destinationViewController;
        
        view.hidesBottomBarWhenPushed = YES;
        
    }
    
}


@end
