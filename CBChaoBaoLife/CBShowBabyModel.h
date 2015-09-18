//
//  CBShowBabyModel.h
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/18.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBShowBabyModel : NSObject
@property(copy,nonatomic)NSString*text;
@property(copy,nonatomic)NSString*name;
@property(copy,nonatomic)NSString*icon;
@property(copy,nonatomic)NSString*picture;
+(instancetype)CBShowBabyModelWithDict:(NSDictionary*)dict;
@end
