//
//  CBCostumeMatchingTableViewCell.h
//  CBChaoBaoLife
//
//  Created by neuedu on 15/10/10.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBCostumeMatching.h"
#import "CBCostumeMatchingModel.h"
@interface CBCostumeMatchingTableViewCell : UITableViewCell

@property(weak,nonatomic)UILabel* des;
@property(weak,nonatomic)UIView* photoView;
@property(weak,nonatomic)UIImageView* imageview;

@property(strong,nonatomic)CBCostumeMatchingModel*costume;

+ (instancetype)CostumeMatchingTableViewCellWithTableView:(UITableView *)tableView;

@end
