//
//  CBHmePageViewController.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBHmePageViewController.h"
#import <RDVTabBarController.h>
#import <RDVTabBarItem.h>
#import "CBWelcomePageViewController.h"
#import "CBShowBabyTableViewController.h"
#import "CBMyBabyTableViewController.h"

@interface CBHmePageViewController ()

@end

@implementation CBHmePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStoryboard* storyboard1 = [UIStoryboard storyboardWithName:@"CBHomePage" bundle:nil];
    
//    UIViewController *firstViewController = [[RDVFirstViewController alloc] init];
    UINavigationController *firstViewController = [storyboard1 instantiateViewControllerWithIdentifier:@"homenav"];
//    UITableViewController*firstViewController=[storyboard1 instantiateViewControllerWithIdentifier:@"homepage"];
    
    UIStoryboard* storyboard2 = [UIStoryboard storyboardWithName:@"CBShowBaby" bundle:nil];
    
    UINavigationController *secondViewController = [storyboard2 instantiateViewControllerWithIdentifier:@"shownav"];
    
    UIStoryboard* storyboard3 = [UIStoryboard storyboardWithName:@"CBNewsPage" bundle:nil];
    UINavigationController *thirdViewController = [storyboard3 instantiateViewControllerWithIdentifier:@"newsnav"];
    
    UIStoryboard* storyboard4 = [UIStoryboard storyboardWithName:@"CBMyBaby" bundle:nil];
    UINavigationController *fourViewController = [storyboard4 instantiateViewControllerWithIdentifier:@"minenav"];
    
    [self setViewControllers:@[firstViewController, secondViewController,
                               thirdViewController,fourViewController]];
    ;
    
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"bottom_btn1", @"bottom_btn2", @"bottom_btn3",@"bottom_btn4"];
    NSArray *tabBarItemTitles = @[@"首页", @"晒宝",@"消息", @"我的"];
    
    RDVTabBar *tabBar = [self tabBar];
    
    [tabBar setFrame:CGRectMake(CGRectGetMinX(tabBar.frame), CGRectGetMinY(tabBar.frame), CGRectGetWidth(tabBar.frame), 50)];
//    tabBar.frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height-50.f, [UIScreen mainScreen].bounds.size.width, 50.f);
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[self tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_checked",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_unchecked",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        item.title = tabBarItemTitles[index];
        
        item.selectedTitleAttributes = @{NSForegroundColorAttributeName: [UIColor purpleColor],
                                         NSFontAttributeName: [UIFont systemFontOfSize:18.f]};
        
        item.unselectedTitleAttributes = @{NSForegroundColorAttributeName: [UIColor grayColor],
                                           NSFontAttributeName: [UIFont systemFontOfSize:16.f]};
        
        index++;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
