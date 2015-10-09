//
//  TabBarHiddenTool.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/10/8.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "TabBarHiddenTool.h"

static TabBarHiddenTool* tool;
@implementation TabBarHiddenTool

+(instancetype)shareTabBarHiddenTool{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        tool = [[TabBarHiddenTool alloc]init];
    });
    return tool;
}

-(void)hiddenTabBar{
    UIViewController * df=[UIApplication sharedApplication].keyWindow.rootViewController;
    if ([df isKindOfClass: [CBHmePageViewController class]]) {
        CBHmePageViewController * first=(CBHmePageViewController *)df;
      
            [first setTabBarHidden:YES];
 
    }
}

-(void)showTabBar{
    UIViewController * df=[UIApplication sharedApplication].keyWindow.rootViewController;
    if ([df isKindOfClass: [CBHmePageViewController class]]) {
        CBHmePageViewController * first=(CBHmePageViewController *)df;
        [UIView animateWithDuration:0.2f animations:^{
            [first setTabBarHidden:NO];
        }];
        
    }
}
@end
