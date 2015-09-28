//
//  CBShowBabyTableViewCell.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/18.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBShowBabyTableViewCell.h"

@implementation CBShowBabyTableViewCell

- (void)awakeFromNib {
    // Initialization code
    UIImageView*icon=[[UIImageView alloc]init];
    _icon=icon;
    [self.contentView addSubview:icon];
    
    UIImageView*pic=[[UIImageView alloc]init];
    _pic=pic;
    [self.contentView addSubview:pic];
    
    UILabel *name=[[UILabel alloc]init];
    _name=name;
    [self.contentView addSubview:name];
    
    UILabel *mytext=[[UILabel alloc]init];
    _mytext=mytext;
    mytext.numberOfLines=0;
    
    [self.contentView addSubview:mytext];
    
    UIButton*Praise=[[UIButton alloc]init];
    _Praise=Praise;
    [self.contentView addSubview:Praise];
   
    UIButton *comment=[[UIButton alloc]init];
    _comment=comment;
    [self.contentView addSubview:comment];
   

}
-(void)layoutSubviews{
    [super layoutSubviews];
    _icon.frame=_frameModel.iconFrame;
    _name.frame=_frameModel.nameFrame;
    _mytext.frame=_frameModel.textFrame;
    _pic.frame=_frameModel.picFrame;
    _Praise.frame=_frameModel.PariseFrame;
    _comment.frame=_frameModel.commentFrame;
    
    
    
}
-(void)setFrameModel:(CBShowBabyFrameModel *)frameModel{
    _frameModel=frameModel;
    CBShowBabyModel*showbaby=frameModel.showbaby;
    _mytext.text=showbaby.text;
    [_icon setImage:[UIImage imageNamed:showbaby.icon]];
    [_pic setImage:[UIImage imageNamed:showbaby.picture]];
    _name.text=showbaby.name;
    [_Praise setTitle:@"点赞" forState:UIControlStateNormal];
    [_Praise setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_comment setTitle:@"评论" forState:UIControlStateNormal];
    [_comment setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
