//
//  ArticleViewController.h
//  studLifeApp
//
//  Created by Yash Dalal on 11/18/15.
//  Copyright © 2015 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleViewController : UIViewController{
    
    NSString *articleTitle;
    NSString *articleContent;
    NSString *dateString;
    NSString *author;
}

@property NSInteger articleID;
@property (strong, nonatomic) IBOutlet UIWebView *articleContainer;
@property (strong, nonatomic) IBOutlet UILabel *label;

@end
