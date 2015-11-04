//
//  CBMineHeaderView.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/17.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBMineHeaderView.h"

#import "CBUserInfoMngTool.h"

@implementation CBMineHeaderView


+(instancetype)CBMineHeaderView{
    CBMineHeaderView*view=[[CBMineHeaderView alloc]init];
    
    return view;
}

#pragma mark 自定义控件
-(instancetype)init{
    self=[super init];
    if (self) {
        
        _imageBG = [[UIImageView alloc]init];
        _imageBG.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
        _imageBG.image = [UIImage imageNamed:@"BG.jpg"];
        [self addSubview:_imageBG];
        _headImageView=[[UIButton alloc]init];
      
        [_headImageView addTarget:self action:@selector(setIcon:) forControlEvents:UIControlEventTouchUpInside];
        _headImageView.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-80)/2, 40, 80, 80);
        _headImageView.layer.cornerRadius = 80/2;
        _headImageView.clipsToBounds = YES;
        
        
        [self addSubview:_headImageView];
        
       
        
        _nameLabel=[[UILabel alloc]init];
        
        _nameLabel.text = [CBUserInfoMngTool sharedCbUserInfoMngTool].userName;
        _nameLabel.textAlignment=NSTextAlignmentCenter;
        _nameLabel.frame=CGRectMake([UIScreen mainScreen].bounds.size.width/2-100.f, CGRectGetMaxY(_headImageView.frame)+5, 200, 20);
        _nameLabel.textAlignment =NSTextAlignmentCenter;
        
        
         [self addSubview:_nameLabel];
        
    
        

    }
    return self;
}


-(void)setIcon:(UIButton*)icon{
    NSLog(@"换头像");
    if ([_delegate respondsToSelector:@selector(CBMineHeaderViewDidbuttonClick:) ]) {
        [_delegate CBMineHeaderViewDidbuttonClick:self];
    }
}
@end
