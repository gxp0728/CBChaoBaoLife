//
//  CBMineHeaderView.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/17.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBMineHeaderView.h"

@implementation CBMineHeaderView


+(instancetype)CBMineHeaderView{
    CBMineHeaderView*view=[[CBMineHeaderView alloc]init];
    return view;
}
-(instancetype)init{
    self=[super init];
    if (self) {
        UIImageView*headerview=[[UIImageView alloc]init];
        _headerview=headerview;
        [headerview setImage:[UIImage imageNamed:@"Default-1"]];
        [self addSubview:headerview];
        UIButton*icon=[[UIButton alloc]init];
        _icon=icon;
        [icon setBackgroundColor:[UIColor redColor]];
       
        UIButton*account=[[UIButton alloc]init];
        
        [account setTitle:@"你好" forState:UIControlStateNormal];
        
        [account setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [self addSubview:icon];
        _account=account;
        [self addSubview:account];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _account.frame=CGRectMake(90.f ,130.f ,100.f,20.f);
    _icon.frame=CGRectMake(20.f, 120.f, 60.f, 60.f);
    _headerview.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}
@end
