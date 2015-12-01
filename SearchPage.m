//
//  SearchPage.m
//  studLifeApp
//
//  Created by Sean McManus on 11/29/15.
//  Copyright © 2015 WUSTL. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "SearchResults.h"
#import "SearchPage.h"

@interface SearchPage ()

@end

@implementation SearchPage

- (void)viewDidLoad {
    [super viewDidLoad];
    searchBar = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 150, 50)];
    searchButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 70, 50)];
    [searchButton setTitle:@"Search" forState:UIControlStateNormal];
    [searchButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    searchBar.layer.cornerRadius=8.0f;
    searchBar.layer.masksToBounds=YES;
    searchBar.layer.borderColor=[[UIColor redColor]CGColor];
    searchBar.layer.borderWidth= 1.0f;
    [searchButton addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchBar];
    [self.view addSubview:searchButton];
    self.navigationController.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)search{
    NSString * query = searchBar.text;
    if(![query isEqual: @""]){
        SearchResults *sr = [[SearchResults alloc] init];
        sr.query = query;
        [self.navigationController pushViewController:sr animated:NO];
    }
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
