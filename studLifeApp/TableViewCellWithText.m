//
//  TableViewCellWithText.m
//  studLifeApp
//
//  Created by Yash Dalal on 11/29/15.
//  Copyright © 2015 WUSTL. All rights reserved.
//

#import "TableViewCellWithText.h"

@implementation TableViewCellWithText

@synthesize category = _category;
@synthesize title = _title;
@synthesize author = _author;
@synthesize date = _date;
@synthesize text = _text;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
