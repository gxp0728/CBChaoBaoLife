//
//  CBCostumeMatchingModel.h
//  CBChaoBaoLife
//
//  Created by neuedu on 15/10/13.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse.h>
@interface CBCostumeMatchingModel : NSObject

@property (copy,nonatomic) NSString *name;
@property (strong,nonatomic) PFFile *images;
@property (copy,nonatomic) NSString *urlString;
@property (copy,nonatomic) NSString *desc;

+(instancetype)costumeMatchingWithDict:(NSDictionary *)dict;
@end
