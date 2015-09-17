//
//  CBMineHeaderView.h
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/17.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import <UIKit/UIKit.h>
#define titleFont UIFont systemFontOfSize:22.f
#define textFont UIFont systemFontOfSize:13.f


@interface CBMineHeaderView : UIView
@property(weak,nonatomic)UIImageView*headerview;
@property(weak,nonatomic)UIButton*account;
@property(weak,nonatomic)UIButton*icon;

+(instancetype)CBMineHeaderView;
@end
