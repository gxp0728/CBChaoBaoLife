//
//  CBProDetailsoViewController.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBProDetailsoViewController.h"
#import "UIView+Extension.h"
#import "CBCoreDataCostumeTool.h"
#import "CBTaoBaoPageViewController.h"

@interface CBProDetailsoViewController ()



@end

@implementation CBProDetailsoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setSubviews];
}

#pragma mark 添加自子控件
-(void)setSubviews{
    
    UIImageView *imageView = [[UIImageView alloc]init];
    [self.view addSubview:imageView];
    imageView.frame = CGRectMake(20.f, 20.f+64.f, [UIScreen mainScreen].bounds.size.width-40.f, 300.f);
    imageView.layer.cornerRadius = 10.f;
    imageView.layer.masksToBounds = YES;
    PFFile * image = _model.images;
    [image getDataInBackgroundWithBlock: ^(NSData *PF_NULLABLE_S data, NSError *PF_NULLABLE_S error){
        if (!error) {
            UIImage * img = [UIImage imageWithData:data];
            [imageView setImage:img];
            
        } else {
            //4
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
    
    UILabel *desc = [[UILabel alloc]init];
    [self.view addSubview:desc];
    desc.frame = CGRectMake(imageView.left+2.f, imageView.bottom+5.f, imageView.width-4.f, 60.f);
    desc.text = _model.desc;
    desc.numberOfLines = 0;
    
    UIButton *check = [[UIButton alloc]init];
    [check setTitle:@"查看详情" forState:UIControlStateNormal];
    [self.view addSubview:check];
    check.frame = CGRectMake(imageView.left, [UIScreen mainScreen].bounds.size.height-40.f-20.f, imageView.width, 40.f);
    check.layer.cornerRadius = 10.f;
    check.backgroundColor = [UIColor redColor];
    [check addTarget:self action:@selector(toTaobao:) forControlEvents:UIControlEventTouchUpInside];
}

-(NSMutableArray *)infoArray{
    if (_infoArray == nil) {
        _infoArray = [NSMutableArray array];
        [_infoArray addObject:_model];
    }
    return _infoArray;
}

#pragma  mark 跳转页面
-(void)toTaobao:(NSString*)url{
    
    [self performSegueWithIdentifier:@"totaobao" sender:_model.urlString];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    CBTaoBaoPageViewController *vc = segue.destinationViewController;
    vc.urlString = sender;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
