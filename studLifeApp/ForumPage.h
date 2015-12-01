//
//  ForumPage.h
//  studLifeApp
//
//  Created by Labuser on 11/17/15.
//  Copyright (c) 2015 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForumPage : UITableViewController{
    NSMutableArray *forumCategories;
    NSMutableArray *forumTitles;
    NSMutableArray *forumAuthors;
    NSMutableArray *forumDates;
    NSMutableArray *forumExcerpts;
    NSMutableArray *forumIds;
}

@property NSInteger index;

@end
