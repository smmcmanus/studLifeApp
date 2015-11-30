//
//  TableViewCellWithImage.h
//  studLifeApp
//
//  Created by Yash Dalal on 11/29/15.
//  Copyright © 2015 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCellWithImage : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *category;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
