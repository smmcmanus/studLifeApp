//
//  SearchResults.h
//  studLifeApp
//
//  Created by Sean McManus on 11/29/15.
//  Copyright © 2015 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResults : UITableViewController{
    NSMutableArray *searchTitles;
    NSMutableArray *searchIds;
}

@property NSString * query;
@property NSInteger index;

@end
