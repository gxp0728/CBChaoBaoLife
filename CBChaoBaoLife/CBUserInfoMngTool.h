//
//  CBUserInfoMngTool.h
//  CBChaoBaoLife
//
//  Created by neuedu on 15/11/3.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Parse.h>
@interface CBUserInfoMngTool : NSObject

+(instancetype)sharedCbUserInfoMngTool;

@property (strong,nonatomic) NSString *userName;
@property (strong,nonatomic) NSString *sex;
@property (strong,nonatomic) UIImage *image;
@property (strong,nonatomic) PFUser *user;
@end
