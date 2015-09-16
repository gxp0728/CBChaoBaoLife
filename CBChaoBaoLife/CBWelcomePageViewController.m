//
//  CBWelcomePageViewController.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBWelcomePageViewController.h"
#import "CBHmePageViewController.h"

#define kStartButtonCenterYRatio 470.f/667.f
#define KpageControlCenterRatio 617.f/667.f
@interface CBWelcomePageViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *WelcomeScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *PageControl;

@end

@implementation CBWelcomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
//scrollView填充屏幕
_WelcomeScrollView.frame=[UIScreen mainScreen].bounds;
// pageControl处于屏幕的637.f／667。f比例的位置
_PageControl.center=CGPointMake([UIScreen mainScreen].bounds.size.width*0.5, self.view.frame.size.height*KpageControlCenterRatio);


//设置scrowView 包括显示的图片以及consize等
[self setupscrowView];
_PageControl.numberOfPages=5;
}

#pragma mark 设置scrowView 包括显示的图片以及consize等
-(void)setupscrowView{
    for (int i=0; i<5; i++) {
        UIImageView*imageView=[[UIImageView alloc]init];
        [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"introduction_%d",i+1]]];
        imageView.frame=CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, self.view.frame.size.width, self.view.frame.size.height);
        //在第五张图片的上面添加一个按钮
        if (i==4) {
            [self addStartButton:imageView];
        }
        
        
        [_WelcomeScrollView addSubview:imageView];
    }
    
    _WelcomeScrollView.contentSize=CGSizeMake(5*self.view.frame.size.width, self.view.frame.size.height);
    _WelcomeScrollView.pagingEnabled=YES;
    _WelcomeScrollView.bounces=NO;
    
}

#pragma mark 添加按钮
-(void)addStartButton:(UIImageView*)imageView{
    UIButton*startButton=[[UIButton alloc]init];
    //如果父控件不接受响应事件那么他所有的子控件都不接受响应事件
    imageView.userInteractionEnabled=YES;
    
    startButton.center=CGPointMake(self.view.frame.size.width*0.5, self.view.frame.size.height*kStartButtonCenterYRatio);
    startButton.bounds=CGRectMake(0, 0, 122, 32);
    [imageView addSubview:startButton];
    [startButton setBackgroundImage:[UIImage imageNamed:@"introduction_enter_nomal"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageNamed:@"introduction_enter_press"] forState:UIControlStateHighlighted];
    [startButton addTarget:self action:@selector(logon:) forControlEvents:UIControlEventTouchUpInside];
    
}


#pragma mark 开启你的潮宝搭配
-(void)logon:(UIButton*)sender{
    
    //直接将主页设置为window的rootViewVCcontoller这样就不会再回到欢迎页了
    //从storeyboard加载控制器过来 首先找到id
    UIStoryboard*storyBoard=[UIStoryboard storyboardWithName:@"CBHomePage" bundle:nil];
    
    CBHmePageViewController*homeVc=   [storyBoard instantiateViewControllerWithIdentifier:@"HomePage"];
    [UIApplication sharedApplication].keyWindow.rootViewController=homeVc;
    
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSUInteger number=(NSUInteger)_WelcomeScrollView.contentOffset.x/self.view.frame.size.width;
    _PageControl.currentPage=number;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
