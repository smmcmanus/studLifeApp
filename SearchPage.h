//
//  SearchPage.h
//  studLifeApp
//
//  Created by Sean McManus on 11/29/15.
//  Copyright © 2015 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchPage : UIViewController{
   // UITextField * searchBar;
    //UIButton * searchButton;
}
@property (strong, nonatomic) IBOutlet UITextField *searchBar;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;

@property (strong,nonatomic) NSString *query;

@end
