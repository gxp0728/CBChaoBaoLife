//
//  CBCostumeMatchingTableViewCell.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/10/10.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBCostumeMatchingTableViewCell.h"
#import "UIView+Extension.h"
#import <Parse.h>
#define Margin 20.f
@implementation CBCostumeMatchingTableViewCell


+(instancetype)CostumeMatchingTableViewCellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"CostumeMatchingTableViewCel";
    
    CBCostumeMatchingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil ) {
        cell = [[CBCostumeMatchingTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    return cell;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    _photoView.transform = CGAffineTransformMakeScale(0.85, 0.85);
    

}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 600.f);
        self.layer.cornerRadius = 10.f;
        
        UIView *photoview = [[UIView alloc]init];
        _photoView = photoview;
        photoview.layer.cornerRadius = 10.f;
        _photoView.layer.masksToBounds = YES;
        [self.contentView addSubview:photoview];
        
        UIImageView *imageview = [[UIImageView alloc]init];
        [self.contentView addSubview:imageview];
//        [imageview setImage:[UIImage imageNamed:@"ad_00"]];
        _imageview = imageview;
        
        imageview.layer.cornerRadius = 10.f;
        imageview.layer.masksToBounds = YES;
        
        UILabel *des = [[UILabel alloc]init];
        
        [self.contentView addSubview:des];
        _des=des;
    }
    
    return self;
}

#pragma mark 设置控件位置

-(void)layoutSubviews{
    [super layoutSubviews];
    
    _photoView.frame = CGRectMake(Margin, Margin, [UIScreen mainScreen].bounds.size.width-2*Margin, self.frame.size.height-2*Margin);
    _des.frame = CGRectMake(_photoView.left+Margin, _photoView.bottom-50.f, _photoView.width-2*Margin, 50.f);
    _imageview.frame = CGRectMake(_photoView.left, _photoView.top, _photoView.width, _photoView.height);
}

#pragma mark 设置模型
-(void)setCostume:(CBCostumeMatchingModel *)costume{
    _costume = costume;
    
    PFFile * image = costume.images;
    [image getDataInBackgroundWithBlock: ^(NSData *PF_NULLABLE_S data, NSError *PF_NULLABLE_S error){
        if (!error) {
            UIImage * img = [UIImage imageWithData:data];
            [_imageview setImage:img];
            
        } else {
            //4
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
   
    
    _des.text = costume.name;
    _des.numberOfLines = 0;
}
@end
