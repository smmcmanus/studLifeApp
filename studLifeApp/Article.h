//
//  Article.h
//  studLifeApp
//
//  Created by Yash Dalal on 11/26/15.
//  Copyright © 2015 WUSTL. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Tag){
    sports,
    news,
    forum,
    scene,
    cadenza
    
};

@interface Article : NSObject <NSCoding>

@property (strong, nonatomic) NSString *author;
    
@property (strong, nonatomic) NSString *title;
    
@property (strong, nonatomic) NSString *content;
    
@property (strong, nonatomic) NSDate *date;
    
@property (assign, nonatomic) Tag category;
    
@property (strong, nonatomic) NSNumber *articleId;

@end
