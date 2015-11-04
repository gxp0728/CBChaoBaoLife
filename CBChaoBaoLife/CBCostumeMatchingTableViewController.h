//
//  CBCostumeMatchingTableViewController.h
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/17.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBCostumeMatchingModel.h"
@interface CBCostumeMatchingTableViewController : UITableViewController

@property(strong,nonatomic)CBCostumeMatchingModel*costumeModel;
@property(strong,nonatomic)NSMutableArray*costumeArray;

@end
