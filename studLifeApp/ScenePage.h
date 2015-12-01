//
//  ScenePage.h
//  studLifeApp
//
//  Created by Labuser on 11/17/15.
//  Copyright (c) 2015 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScenePage : UITableViewController{
    NSMutableArray *sceneCategories;
    NSMutableArray *sceneTitles;
    NSMutableArray *sceneAuthors;
    NSMutableArray *sceneDates;
    NSMutableArray *sceneExcerpts;
    NSMutableArray *sceneIds;
}

@property NSInteger index;

@end
