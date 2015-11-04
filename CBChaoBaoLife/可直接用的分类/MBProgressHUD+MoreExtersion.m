//
//  MBProgressHUD+MoreExtersion.m
//  KGKuGouPlayer
//
//  Created by neuedu on 15/10/20.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "MBProgressHUD+MoreExtersion.h"

@implementation MBProgressHUD (MoreExtersion)

+(instancetype)showHUDAddedTo:(UIView *)view LableText:(NSString *)lableText animated:(BOOL)animated{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:animated];
    hud.labelText = lableText;
    return hud;
}

+(void)showTipToWindow:(NSString *)tip{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo: [UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = tip;
    //距离屏幕的中心点向上或者向下偏离多少，屏幕下方，占整个屏幕的1/4
    hud.yOffset = [UIScreen mainScreen].bounds.size.height
    /4;
    [hud hide:YES afterDelay:2.f];
    
}
@end
