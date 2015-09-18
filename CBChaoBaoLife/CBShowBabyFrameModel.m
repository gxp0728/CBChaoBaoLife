//
//  CBShowBabyFrameModel.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/18.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBShowBabyFrameModel.h"
#import "NSString+MoreExtentions.h"
@implementation CBShowBabyFrameModel
+(instancetype)CBShowBabyFrameModelWithModel:(CBShowBabyModel *)showbaby{
    CBShowBabyFrameModel*frameModel=[[CBShowBabyFrameModel alloc]init];
    if (frameModel) {
        [frameModel initWithModel:showbaby];
    }
    return frameModel;
}

-(void)initWithModel:(CBShowBabyModel*)showbaby{
    _showbaby=showbaby;
    
    _iconFrame=CGRectMake(kMargin, kMargin, 44.f, 44.f);
    _nameFrame=CGRectMake(CGRectGetMaxX(_iconFrame), CGRectGetMinY(_iconFrame), [showbaby.name widthForWidth:[UIScreen mainScreen].bounds.size.width Font:kNameFont], 44.f);
    
    _textFrame=CGRectMake(CGRectGetMinX(_iconFrame), CGRectGetMaxY(_iconFrame), [showbaby.text widthForWidth:[UIScreen mainScreen].bounds.size.width-kMargin Font:kTextFont], [showbaby.text heightForWidth:[UIScreen mainScreen].bounds.size.height-kMargin Font:kTextFont]);
    if (showbaby.picture==nil||showbaby.picture.length==0) {
        _picFrame=CGRectZero;
    }else{
        _picFrame=CGRectMake(CGRectGetMinX(_iconFrame), CGRectGetMaxY(_textFrame), 120.f, 120.f);
    }
    
}

-(CGFloat)cellHeight{
    if (_showbaby.picture==nil||_showbaby.picture.length==0) {
        return CGRectGetMaxY(_textFrame)+2*kMargin;
    }else{
        return CGRectGetMaxY(_picFrame)+2*kMargin;
    }
}
@end
