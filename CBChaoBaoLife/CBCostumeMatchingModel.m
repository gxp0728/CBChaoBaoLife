//
//  CBCostumeMatchingModel.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/10/13.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBCostumeMatchingModel.h"

@implementation CBCostumeMatchingModel


+(instancetype)costumeMatchingWithDict:(NSDictionary *)dict{
    
    CBCostumeMatchingModel *model = [[CBCostumeMatchingModel alloc]init];
    model.name = [dict objectForKey:@"name"];
    model.images = [dict objectForKey:@"images"];
    model.desc = [dict objectForKey:@"desc"];
    model.urlString = [dict objectForKey:@"urlString"];
    return model;
}
@end
