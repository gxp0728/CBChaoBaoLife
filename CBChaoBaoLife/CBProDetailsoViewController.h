//
//  CBProDetailsoViewController.h
//  CBChaoBaoLife
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBCostumeMatching.h"
#import "CBCostumeMatchingModel.h"
@interface CBProDetailsoViewController : UIViewController


@property (strong,nonatomic) UIImage *image;
@property (strong,nonatomic) NSString *desc;

@property (strong,nonatomic)NSMutableArray *infoArray;
@property (strong,nonatomic)CBCostumeMatchingModel *model;
@end
