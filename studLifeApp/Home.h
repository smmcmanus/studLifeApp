//
//  Home.h
//  studLifeApp
//
//  Created by Labuser on 11/17/15.
//  Copyright (c) 2015 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home : UITableViewController{
    NSMutableArray *homeCategories;
    NSMutableArray *homeTitles;
    NSMutableArray *homeAuthors;
    NSMutableArray *homeDates;
    NSMutableArray *homeExcerpts;
    NSMutableArray *homeIds;
    
    
}

@property NSInteger index;
//@property (nonatomic,strong) IBOutlet UIActivityIndicatorView *spinner;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
