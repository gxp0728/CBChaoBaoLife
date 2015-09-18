//
//  CBShowBabyModel.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/18.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBShowBabyModel.h"

@implementation CBShowBabyModel
+(instancetype)CBShowBabyModelWithDict:(NSDictionary *)dict{
    CBShowBabyModel*model=[[CBShowBabyModel alloc]init];
    if (model) {
        [model setValuesForKeysWithDictionary:dict];
        
    }
    return model;
}

@end
