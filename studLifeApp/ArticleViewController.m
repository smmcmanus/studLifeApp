//
//  ArticleViewController.m
//  studLifeApp
//
//  Created by Yash Dalal on 11/18/15.
//  Copyright © 2015 WUSTL. All rights reserved.
//

#import "ArticleViewController.h"

@implementation ArticleViewController
@synthesize articleID;

- (void) viewDidLoad {
    
    NSLog(@"Works: %ld", (long)articleID);

    [self getTitles];
    
}

-(void) getTitles {
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
                               [self printArticle];
                               
                           }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) printArticle {
    //NSLog(@">>>%@ %@ %@ %@", articleTitle, articleContent, dateString, author);
    UILabel *x = [[UILabel alloc]initWithFrame:CGRectMake(10, -50, 300, 300)];
    [x setText:articleTitle];
    [self.view addSubview:x];
    UILabel *y = [[UILabel alloc]initWithFrame:CGRectMake(10, -25, 300, 300)];
    [y setText:author];
    [self.view addSubview:y];
    //UITextField
    UIWebView *contentWebView = [[UIWebView alloc]initWithFrame:CGRectMake(10, 150, 300, 350)];
    [contentWebView loadHTMLString:articleContent baseURL:nil];
    [self.view addSubview:contentWebView];
}

@end
