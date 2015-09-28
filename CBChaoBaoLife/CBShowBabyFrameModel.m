//
//  CBShowBabyFrameModel.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/18.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBShowBabyFrameModel.h"

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
    _nameFrame=CGRectMake(CGRectGetMaxX(_iconFrame)+kMargin, CGRectGetMinY(_iconFrame), [showbaby.name widthForWidth:[UIScreen mainScreen].bounds.size.width Font:kNameFont], 44.f);
    
    CGFloat textFrameX = kMargin;
    CGFloat textFrameY = CGRectGetMaxY(_iconFrame)+kMargin;
    //CGFloat textFrameW = [UIScreen mainScreen].bounds.size.width - 2*kMargin;
    CGFloat  textFrameW=[showbaby.text widthForWidth:[UIScreen mainScreen].bounds.size.width-2*kMargin Font:kTextFont];
    CGFloat textFrameH = [showbaby.text heightForWidth:textFrameW Font:kTextFont];
    _textFrame = CGRectMake(textFrameX, textFrameY, textFrameW, textFrameH);
    
    if (showbaby.picture==nil||showbaby.picture.length==0) {
        _picFrame=CGRectZero;
        _PariseFrame=CGRectMake(CGRectGetMinX(_textFrame), CGRectGetMaxY(_textFrame), 44.f, 44.f);
        _commentFrame=CGRectMake(CGRectGetMaxX(_PariseFrame)+8.f, CGRectGetMinY(_PariseFrame), 44.f, 44.f);
    }else{
      
        _picFrame=CGRectMake(CGRectGetMinX(_iconFrame), CGRectGetMaxY(_textFrame), 90.f, 90.f);
        _PariseFrame=CGRectMake(CGRectGetMinX(_textFrame), CGRectGetMaxY(_picFrame), 44.f, 44.f);
        _commentFrame=CGRectMake(CGRectGetMaxX(_PariseFrame)+8.f, CGRectGetMinY(_PariseFrame), 44.f, 44.f);
        
    }
    
}

-(CGFloat)cellHeight{
    if (_showbaby.picture==nil||_showbaby.picture.length==0) {
        return CGRectGetMaxY(_PariseFrame)+3*kMargin;
    }else{
        return CGRectGetMaxY(_PariseFrame)+3*kMargin;
    }
}
@end
