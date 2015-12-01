//
//  NewsPage.h
//  studLifeApp
//
//  Created by Labuser on 11/17/15.
//  Copyright (c) 2015 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsPage : UITableViewController{
    NSMutableArray *newsCategories;
    NSMutableArray *newsTitles;
    NSMutableArray *newsAuthors;
    NSMutableArray *newsDates;
    NSMutableArray *newsExcerpts;
    NSMutableArray *newsIds;
}

@property NSInteger index;

@end
