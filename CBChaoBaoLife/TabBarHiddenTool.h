//
//  TabBarHiddenTool.h
//  CBChaoBaoLife
//
//  Created by neuedu on 15/10/8.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBHmePageViewController.h"

@interface TabBarHiddenTool : NSObject

+(instancetype)shareTabBarHiddenTool;

-(void)hiddenTabBar;

-(void)showTabBar;

@end
