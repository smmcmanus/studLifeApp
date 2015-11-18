//
//  ArticleViewController.h
//  studLifeApp
//
//  Created by Yash Dalal on 11/17/15.
//  Copyright © 2015 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleViewController : UIViewController

@property NSInteger articleID;
@property NSString *articleTitle;
@property NSString *articleContent;
@property NSString *dateString;
@property NSString *author;

@property(strong, nonatomic) UIWebView *contentWebView;

@end
