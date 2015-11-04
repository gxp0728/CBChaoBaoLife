//
//  CBAppInfoViewController.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/11/2.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBAppInfoViewController.h"
#import "NSString+MoreExtentions.h"
#import "UIView+Extension.h"
#define kFont
@interface CBAppInfoViewController ()

@end

@implementation CBAppInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setSubviews];
}


#pragma mark 添加子控件
-(void)setSubviews{
    
    UIImageView *icon = [[UIImageView alloc]init];
    icon.center = self.view.center;
    icon.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width/2)-30.f, 150.f, 60.f, 60.f);
    icon.backgroundColor = [UIColor redColor];
    icon.layer.cornerRadius = 10.f;
    icon.layer.masksToBounds = YES;
    [self.view addSubview:icon];
    
    UILabel *name = [[UILabel alloc]init];
    name.center = icon.center;
    name.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width/2)-75.f, icon.bottom+20.f, 150.f, 20.f);
    name.text = @"潮宝 v1.1.1(1111)";
    name.textColor = [UIColor grayColor];
    [self.view addSubview:name];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
