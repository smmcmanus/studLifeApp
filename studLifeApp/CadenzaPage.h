//
//  CadenzaPage.h
//  studLifeApp
//
//  Created by Labuser on 11/17/15.
//  Copyright (c) 2015 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CadenzaPage : UITableViewController{
    NSMutableArray *cadenzaCategories;
    NSMutableArray *cadenzaTitles;
    NSMutableArray *cadenzaAuthors;
    NSMutableArray *cadenzaDates;
    NSMutableArray *cadenzaExcerpts;
    NSMutableArray *cadenzaIds;
}

@property NSInteger index;

@end
