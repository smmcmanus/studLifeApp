//
//  SportsPage.h
//  studLifeApp
//
//  Created by Labuser on 11/17/15.
//  Copyright (c) 2015 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SportsPage : UITableViewController{    
    NSMutableArray *sportCategories;
    NSMutableArray *sportTitles;
    NSMutableArray *sportAuthors;
    NSMutableArray *sportDates;
    NSMutableArray *sportExcerpts;
    NSMutableArray *sportIds;
}

@property NSInteger index;

@end
