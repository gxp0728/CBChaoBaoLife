//
//  CBCoreDataCostumeTool.h
//  CBChaoBaoLife
//
//  Created by neuedu on 15/10/11.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBCoreDataCostumeTool : NSObject


@property (strong,nonatomic) NSArray *costumeArray;
@property (copy,nonatomic) NSString *urlString;
+ (instancetype)shareCoreDataCostumeTool;

+ (NSArray *)searchCostume;

@end
