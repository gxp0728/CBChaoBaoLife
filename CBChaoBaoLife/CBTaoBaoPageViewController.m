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
    NSURL *url = [NSURL URLWithString:@"taobao://click.simba.taobao.com/cc_im?spm=a230r.1.14.1.qX2zEM&p=%B6%F9%CD%AF%B7%FE%D7%B0&s=935325067&k=397&e=V3F8I9ensAhlNpwO45RwJ22sv8MtbCwabQuMG969Mm1ER73M2FaVxmy5h3ypM5WaWtRom5zqovOKooWUfXBZL8mdnQ%2BfqTnPnFhukJGvysy8pqhQrJu%2FFyyz%2F6VyzrLqS4P16WYpd4VvODiGcX2qMn18c85ZiATNC0zVGkNBNfCBmeN1thBwgOhl3E5nf9ROTBk9VoF%2B8AFxW82LKNXm4UUeukneFBwNKUX%2FEZsr%2Bczr4RiR2QBFRvOxAf%2FgsthjZLz8Nw1BGC9wJUJLi4D9hqPF6pbn5oYf%2FH5oeeSfdYBt9ObxEUfc3U7rf%2FqadiTO0tzvnJIkz5Xb4xWcsr%2F50MUEeoXpIN8U76gpXFbe50dxW82LKNXm4cz20Gfdg0mR3%2BRGk8Cel6c%3D"];
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
