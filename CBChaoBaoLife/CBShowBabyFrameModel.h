//
//  CBShowBabyFrameModel.h
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/18.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBShowBabyModel.h"
#import "NSString+MoreExtentions.h"
#import "UIView+Extension.h"
#import <UIKit/UIKit.h>
#define kMargin 16.f
#define kNameFont [UIFont systemFontOfSize:18.f]
#define kTextFont [UIFont systemFontOfSize:16.f]
@interface CBShowBabyFrameModel : NSObject
@property(assign,nonatomic)CGRect iconFrame;
@property(assign,nonatomic)CGRect textFrame;
@property(assign,nonatomic)CGRect nameFrame;
@property(assign,nonatomic)CGRect picFrame;
@property(assign,nonatomic)CGRect PariseFrame;
@property(assign,nonatomic)CGRect commentFrame;
@property(strong,nonatomic)CBShowBabyModel*showbaby;
+(instancetype)CBShowBabyFrameModelWithModel:(CBShowBabyModel*)showbaby;

@property(assign,nonatomic)CGFloat cellHeight;

@end
