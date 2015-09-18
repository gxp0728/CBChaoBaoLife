//
//  CBShowBabyTableViewCell.h
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/18.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBShowBabyFrameModel.h"
@interface CBShowBabyTableViewCell : UITableViewCell


@property(weak,nonatomic)UIImageView*icon;
@property(weak,nonatomic)UILabel*name;
@property(weak,nonatomic)UILabel*mytext;
@property(weak,nonatomic)UIImageView*pic;
@property(weak,nonatomic)UIButton*Praise;//点赞
@property(weak,nonatomic)UIButton*comment;//评论

@property(strong,nonatomic)CBShowBabyFrameModel*frameModel;


@end
