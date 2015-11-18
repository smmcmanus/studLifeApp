//
//  ArticleViewController.m
//  studLifeApp
//
//  Created by Yash Dalal on 11/17/15.
//  Copyright © 2015 WUSTL. All rights reserved.
//

#import "ArticleViewController.h"

@implementation ArticleViewController

@synthesize articleID;
@synthesize articleTitle;
@synthesize articleContent;
@synthesize dateString;
@synthesize author;
@synthesize contentWebView;

- (void) viewDidLoad {
    
    NSLog(@"appeared with id: %ld", (long)articleID);
    [self getArticle];
    [self printArticle];
    
}

-(void) getArticle {
    NSString *todayJson = [NSString stringWithFormat:@"http://www.studlife.com/api/get_post/?post_id=%ld",(long)articleID];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:todayJson]];
    __block NSDictionary *json;
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               json = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:nil];
                               articleTitle = json[@"post"][@"title"];
                               articleContent = json[@"post"][@"content"];
                               dateString = json[@"post"][@"date"];
                               author = json[@"post"][@"author"][@"name"];
                           }];
    NSLog(@"Title: %@ Content: %@ Date: %@ Author: %@",articleTitle,articleContent,dateString,author);
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) printArticle {
    contentWebView = [[UIWebView alloc]initWithFrame:CGRectMake(300, 600, 300, 600)];
    [contentWebView loadHTMLString:articleContent baseURL:nil];
    [self.view addSubview:contentWebView];
}

@end
