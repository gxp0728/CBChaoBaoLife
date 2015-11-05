//
//  CBTaoBaoPageViewController.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBTaoBaoPageViewController.h"

@interface CBTaoBaoPageViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation CBTaoBaoPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",_urlString);
    // 构建淘宝客户端协议的 URL
    NSArray *urlArray = [_urlString componentsSeparatedByString:@":"];
    NSString *urlString = [NSString stringWithFormat:@"taobao:%@",[urlArray lastObject]];
    NSURL *url = [NSURL URLWithString:urlString];
    // 判断当前系统是否有安装淘宝客户端
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        // 如果已经安装淘宝客户端，就使用客户端打开链接
        [[UIApplication sharedApplication] openURL:url];
    } else {
        // 否则使用 Mobile Safari 或者内嵌 WebView 来显示
        url = [NSURL URLWithString:_urlString];
        NSURLRequest *request =[NSURLRequest requestWithURL:url];
        [self.view addSubview: _webView];
        [_webView loadRequest:request];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    NSLog(@"%@",_urlString);
}
@end
