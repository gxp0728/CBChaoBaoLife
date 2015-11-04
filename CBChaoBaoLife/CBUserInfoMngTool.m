//
//  CBUserInfoMngTool.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/11/3.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBUserInfoMngTool.h"

static CBUserInfoMngTool*tool;
@implementation CBUserInfoMngTool

+(instancetype)sharedCbUserInfoMngTool{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        tool = [[CBUserInfoMngTool alloc]init];
        
    }) ;
    return tool;
}
@end
