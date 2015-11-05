//
//  CBOpinionViewController.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/11/3.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBOpinionViewController.h"
#import "UIView+Extension.h"
@interface CBOpinionViewController ()

@property (weak,nonatomic)UILabel *placeHolder;

@end

@implementation CBOpinionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setSubviews];
    
}
#pragma mark 添加子控件
-(void)setSubviews{
    UITextView *text = [[UITextView alloc]init];
    [self.view addSubview:text];
    text.delegate = self;
    text.textAlignment = 0;
    text.frame = CGRectMake(20,30.f+64.f , [UIScreen mainScreen].bounds.size.width-40.f, 150.f);
    text.backgroundColor = [UIColor colorWithRed:242.f/255.f green:242.f/255.f blue:242.f/255.f alpha:1.f];
    text.layer.cornerRadius = 10.f;
    text.font = [UIFont systemFontOfSize:17.f];
    UILabel *placeHolder = [[UILabel alloc]init];
    [text addSubview:placeHolder];
    _placeHolder = placeHolder;
    placeHolder.frame = CGRectMake(2, 0, text.width, 40.f);
    placeHolder.textColor = [UIColor colorWithRed:143.f/255.f green:143.f/255.f blue:143.f/255.f alpha:1];
    placeHolder.text = @"您的意见就是我们最大的动力!";
  
    text.contentInset = UIEdgeInsetsMake(-64.f, 0, 0, 0);
//    text.placeholder =;
    
    
    UILabel *info = [[UILabel alloc]init];
    [self.view addSubview:info];
    info.frame = CGRectMake(text.left+4.f, text.top-25.f, 100.f, 20.f);
    info.text = @"反馈信息";
    info.font = [UIFont systemFontOfSize:13.f];
    info.textColor  = [UIColor grayColor];
    
    UITextView *number = [[UITextView alloc]init];
    number.contentInset = UIEdgeInsetsMake(11.f, 0, 0, 0);
    number.font = [UIFont systemFontOfSize:17.f];
    [self.view addSubview:number];
    number.textAlignment = 0;
    number.frame = CGRectMake(text.left,text.bottom+40.f,text.width,40.f);
    number.backgroundColor = [UIColor colorWithRed:242.f/255.f green:242.f/255.f blue:242.f/255.f alpha:1.f];
    number.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    number.layer.cornerRadius = 10.f;
    
    UILabel *connectStyle = [[UILabel alloc]init];
    [self.view addSubview:connectStyle];
    connectStyle.text = @"联系方式";
    connectStyle.frame = CGRectMake(info.left, number.top-22.f, 100, 20.f);
    connectStyle.textColor = [UIColor grayColor];
    connectStyle.font = [UIFont systemFontOfSize:13.f];
    
}

#pragma mark textview代理函数
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;{
    _placeHolder.text =@"";
    return YES;
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text == nil||textView.text.length == 0) {
        _placeHolder.text = @"您的意见就是我们最大的动力";
    }else{
        return;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
