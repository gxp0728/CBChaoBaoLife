//
//  MBProgressHUD+MoreExtersion.h
//  KGKuGouPlayer
//
//  Created by neuedu on 15/10/20.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (MoreExtersion)

+(MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view  LableText:(NSString*)lableText animated:(BOOL)animated;

//将指定的提示语显示到window上3秒钟
+ (void)showTipToWindow:(NSString *)tip;
@end
