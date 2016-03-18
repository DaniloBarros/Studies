//
//  ViewController.m
//  WebService
//
//  Created by Danilo Barros Mendes on 7/7/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //http://isbndb.com/api/v2/json/HQOUAIV6/books?q=science
    //http://isbndb.com/api/v2/json/HQOUAIV6/book/9780816081530
    //http://isbndb.com/api/v2/json/HQOUAIV6/books?q=Fehl&i=author_name
    
    NSString *isbn = @"/9781591361299";
    NSString *titleScience = @"s?q=Percy%20Jackson";
    NSString *authorNameFehl = @"s?q=Fehl&i=author_name";
    
    NSString *url = [NSString stringWithFormat:@"http://isbndb.com/api/v2/json/HQOUAIV6/book%@",titleScience];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30.0];
    
    NSData *data;
    NSURLResponse *dataResponse;
    NSError *e;
    
    data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&dataResponse error:&e];
    
    NSDictionary *object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&e];
    
    int currentPage = [[object valueForKey:@"current_page"] intValue];
    int pageCount = [[object valueForKey:@"page_count"] intValue];
    
    NSArray *booksJSON = [object objectForKey:@"data"];
    
    for (int i=0; i<[booksJSON count]; i++) {
        
        NSDictionary *bk = booksJSON[i];
        
        NSString *title = [bk valueForKey:@"title"];
        NSArray *author = [[bk valueForKey:@"author_data"] valueForKey:@"name"];
        NSString *isbn13 = [bk valueForKey:@"isbn13"];
        NSString *isbn10 = [bk valueForKey:@"isbn10"];
        NSString *publisher = [bk valueForKey:@"publisher_text"];
        NSString *summary = [bk valueForKey:@"summary"];
        
        
        NSLog(@"Title:\t%@\nAuthors:\t%@\nISBN13:\t%@\nISBN10:\t%@\nPublisher:\t%@\nSummary:\t%@\n\n",title, author, isbn13, isbn10, publisher, summary);
    }

    
    /*
     //Assynchronous
    NSURLRequest *request = [NSURLRequest
                             requestWithURL:[NSURL URLWithString:url]
                             cachePolicy:NSURLRequestReturnCacheDataElseLoad
                             timeoutInterval:30.0];
    

    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark NSURLConnection Methods

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    //Response received
    //Initialize _responseData, next append data to it in the didReceiveData Method
    //Called each time there is a redirect, reinitializing it
    
    _responseData = [[NSMutableData alloc] init];
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    //Append new data to the instance of _responseData
    
    [self.responseData appendData:data];
}

-(NSCachedURLResponse *)connection:(NSURLConnection *)connection
                 willCacheResponse:(NSCachedURLResponse *)cachedResponse{
    
    //Return nil to indicate not necessary to store a cached response for this connection
    
    return nil;
    
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    //Request is complete and data has been received
    //Parse the stuff in _responseData
    
    NSError *e;
    
    NSDictionary *object = [NSJSONSerialization JSONObjectWithData:self.responseData
                                                           options:NSJSONReadingMutableContainers
                                                             error:&e];
    
    
    int currentPage = [[object valueForKey:@"current_page"] intValue];
    int pageCount = [[object valueForKey:@"page_count"] intValue];
    
    NSArray *booksJSON = [object objectForKey:@"data"];
    
    for (int i=0; i<[booksJSON count]; i++) {
        
        NSDictionary *bk = booksJSON[i];
        
        NSString *title = [bk valueForKey:@"title"];
        NSArray *author = [[bk valueForKey:@"author_data"] valueForKey:@"name"];
        NSString *isbn13 = [bk valueForKey:@"isbn13"];
        NSString *isbn10 = [bk valueForKey:@"isbn10"];
        NSString *publisher = [bk valueForKey:@"publisher_text"];
        NSString *summary = [bk valueForKey:@"summary"];
        
        
        NSLog(@"Title:\t%@\nAuthors:\t%@\nISBN13:\t%@\nISBN10:\t%@\nPublisher:\t%@\nSummary:\t%@\n\n",title, author, isbn13, isbn10, publisher, summary);
    }
    
    
    
    /*for (int i = 0; i < [object count]; i++) {
        NSLog(@"Title: %@", [object[i] objectForKey:@"title"]);
        NSLog(@"Author: %@",[object[i] objectForKey:@"author_data"]);
        NSLog(@"ISBN: %@\n\n",[object[i] objectForKey:@"isbn13"]);
    }*/
    
    
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    //Request has failed for some reason
    //Check the error
    
    NSLog(@"%@",error);
    
}

@end
