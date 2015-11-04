//
//  CBMyBabyTableViewController.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 gxp. All rights reserved.
//


#define KScreen_Width [UIScreen mainScreen].bounds.size.width
#define KScreen_Height [UIScreen mainScreen].bounds.size.height

#import "CBMyBabyTableViewController.h"
#import "CBMineHeaderView.h"
#import "CBTabBarHiddenTool.h"
#import "CBUserInfoMngTool.h"
const CGFloat BackGroupHeight = 200;
const CGFloat HeadImageHeight= 100;

@interface CBMyBabyTableViewController ()

@property(strong,nonatomic)CBMineHeaderView *headerView;

@end

@implementation CBMyBabyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    CBMineHeaderView*headerview=[CBMineHeaderView CBMineHeaderView];
    _headerView = headerview;
    _headerView.delegate = self;
    
    headerview.frame=CGRectMake(0, 0, self.view.frame.size.width, 200.f);
    self.tableView.tableHeaderView=headerview;
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init] ];
    
    
    UIButton *rightBtn =
    [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 25)];
    [rightBtn setTitle:@"设置" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(set:) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem=rightItem;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BGimage.jpg"] forBarMetrics:UIBarMetricsDefault];
    //    CGFloat alpha = (yOffset+BackGroupHeight)/BackGroupHeight;
    CGFloat alpha = 0;
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[[UIColor clearColor]colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toMyinfo:)];
    _headerView.nameLabel.userInteractionEnabled = YES;
    tap.numberOfTapsRequired = 1;
    [_headerView.nameLabel addGestureRecognizer:tap];
}

-(void)toMyinfo:(UILabel *)nameLable{
    [self performSegueWithIdentifier:@"tomyinfo" sender:nil];
}

#pragma mark 界面将要显示函数
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([CBUserInfoMngTool sharedCbUserInfoMngTool].image == nil) {
        [_headerView.headImageView setImage:[UIImage imageNamed:@"myheadimage.jpeg"] forState:UIControlStateNormal];
        
    }else{
    [_headerView.headImageView setImage:[CBUserInfoMngTool sharedCbUserInfoMngTool].image forState:UIControlStateNormal];
        
    
    }
    if ([CBUserInfoMngTool sharedCbUserInfoMngTool].userName == nil) {
        _headerView.nameLabel.text = @"还不知道你叫什么呢?";
    }else{
        _headerView.nameLabel.text = [CBUserInfoMngTool sharedCbUserInfoMngTool].userName;
    }
    
    
}



-(void)CBMineHeaderViewDidbuttonClick:(CBMineHeaderView *)mineHeaderView{
    
    [self performSegueWithIdentifier:@"tomyinfo" sender:nil];
}
-(void)set:(UIBarButtonItem*)item{
    [self performSegueWithIdentifier:@"toset" sender:nil];
}

#pragma mark - 滑动控价变化
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset  = scrollView.contentOffset.y-200.f;
    CGFloat xOffset = (yOffset + BackGroupHeight)/2;
    
    if (yOffset < -BackGroupHeight) {
        
        CGRect rect = self.headerView.imageBG.frame;
        rect.origin.y = yOffset;
        rect.size.height =  -yOffset+200.f ;
        rect.origin.x = xOffset;
        rect.size.width = KScreen_Width + fabs(xOffset)*2;
        self.headerView.imageBG.frame = rect;
        CGRect HeadImageRect = CGRectMake((KScreen_Width-HeadImageHeight)/2, 40, HeadImageHeight, HeadImageHeight);
        HeadImageRect.origin.y = self.headerView.headImageView.frame.origin.y;
        HeadImageRect.size.height =  HeadImageHeight + fabs(xOffset)*0.5-20.5f ;
        HeadImageRect.origin.x = self.view.center.x - HeadImageRect.size.height/2;
        HeadImageRect.size.width = HeadImageHeight + fabs(xOffset)*0.5-20.5f;
        self.headerView.headImageView.frame = HeadImageRect;
        self.headerView.headImageView.layer.cornerRadius = HeadImageRect.size.height/2;
        self.headerView.headImageView.clipsToBounds = YES;
        
        CGRect NameRect = CGRectMake((KScreen_Width-HeadImageHeight)/2, CGRectGetMaxY(self.headerView.headImageView.frame)+5, HeadImageHeight, 20);
        NameRect.origin.y = CGRectGetMaxY(self.headerView.headImageView.frame)+5;
        NameRect.size.height =  20 + fabs(xOffset)*0.5 ;
        NameRect.size.width = HeadImageHeight + fabs(xOffset)*0.5;
        NameRect.origin.x = self.view.center.x - NameRect.size.width/2;
        
        self.headerView.nameLabel.font=[UIFont systemFontOfSize:17+fabs(xOffset)*0.2];
        
        self.headerView.nameLabel.frame = NameRect;
        
        
    }else{
        CGRect HeadImageRect = CGRectMake((KScreen_Width-HeadImageHeight)/2, 40, HeadImageHeight, HeadImageHeight);
        HeadImageRect.origin.y = self.headerView.headImageView.frame.origin.y;
        HeadImageRect.size.height =  HeadImageHeight - fabs(xOffset)*0.5 -20.f;
        HeadImageRect.origin.x = self.view.center.x - HeadImageRect.size.height/2;
        HeadImageRect.size.width = HeadImageHeight - fabs(xOffset)*0.5-20.f;
        self.headerView.headImageView.frame = HeadImageRect;
        self.headerView.headImageView.layer.cornerRadius = HeadImageRect.size.height/2;
        self.headerView.headImageView.clipsToBounds = YES;
        
        CGRect NameRect = CGRectMake((KScreen_Width-HeadImageHeight)/2, CGRectGetMaxY(self.headerView.headImageView.frame)+5, HeadImageHeight, 20);
        NameRect.origin.y = CGRectGetMaxY(self.headerView.headImageView.frame)+5;
        NameRect.size.height =  20;
        NameRect.size.width = HeadImageHeight - fabs(xOffset)*0.5;
        NameRect.origin.x = self.view.center.x - NameRect.size.width/2;
        
        
        self.headerView.nameLabel.font=[UIFont systemFontOfSize:17-fabs(xOffset)*0.2];
        
        self.headerView.nameLabel.frame = NameRect;
        
    }
    
    
}


- (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return theImage;
}

#pragma mark 界面切换
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0&&indexPath.row == 0) {
        [self performSegueWithIdentifier:@"tomyinfo" sender:nil];
    }else if (indexPath.section == 2&&indexPath.row == 0){
        [self performSegueWithIdentifier:@"toappInfo" sender:nil];
    }else if(indexPath.section == 1&&indexPath.row == 0){
        [self performSegueWithIdentifier:@"toyjpage" sender:nil];
    }
}
@end
