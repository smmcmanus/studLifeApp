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
    _searchBar = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 150, 50)];
    _searchButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 70, 50)];
    [_searchButton setTitle:@"Search" forState:UIControlStateNormal];
    [_searchButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _searchBar.layer.cornerRadius=8.0f;
    _searchBar.layer.masksToBounds=YES;
    _searchBar.layer.borderColor=[[UIColor redColor]CGColor];
    _searchBar.layer.borderWidth= 1.0f;
    [_searchButton addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_searchBar];
    [self.view addSubview:_searchButton];
    self.navigationController.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)search{
    _query = _searchBar.text;
    if(![_query isEqual: @""]){
       /* SearchResults *sr = [[SearchResults alloc] init];
        sr.query = query;
        [self.navigationController pushViewController:sr animated:NO];*/
        [self performSegueWithIdentifier:@"goToSearchResults" sender:self];

    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"In prep");
    if ([segue.identifier isEqualToString:@"goToSearchResults"])
    {
        SearchResults *controller = (SearchResults*)segue.destinationViewController;
        controller.query = _query;
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
