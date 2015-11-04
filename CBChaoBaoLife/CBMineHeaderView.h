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
@class CBMineHeaderView;
@protocol CBMineHeaderViewDelegate <NSObject>

@required
-(void)CBMineHeaderViewDidbuttonClick:(CBMineHeaderView*)mineHeaderView;

@end
@interface CBMineHeaderView : UIView


@property (nonatomic, strong) UIImageView *imageBG;
@property (nonatomic, strong) UIView *BGView;
@property (nonatomic, strong) UIButton *headImageView;
@property (nonatomic, strong) UILabel *nameLabel;

@property (weak,nonatomic)id<CBMineHeaderViewDelegate>delegate;
+(instancetype)CBMineHeaderView;
@end
