//
//  ViewController.m
//  studLifeApp
//
//  Created by Sean McManus on 11/15/15.
//  Copyright © 2015 Sean McManus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Hello World!");
    
    NSString *todayJson = @"http://www.studlife.com/api/get_recent_posts/?count=1";
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:todayJson]];
    __block NSDictionary *json;
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               json = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:nil];
                               content = json[@"posts"][0][@"content"];
                               NSLog(@"%@", content);
                               [self setContent];
                               
                           }];
    // Do any additional setup after loading the view, typically from a nib.
    
}

-(void) setContent{
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 300, 600)];
    UIWebView *contentView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 300, 1000)];
    [self.view addSubview:scroll];
    [scroll addSubview:contentView];
    scroll.contentSize = CGSizeMake(contentView.frame.size.width, contentView.frame.size.height);
    [contentView loadHTMLString:content baseURL:nil];
    NSLog(@"here");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
