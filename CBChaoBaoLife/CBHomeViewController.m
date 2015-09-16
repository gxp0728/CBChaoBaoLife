//
//  CBHomeViewController.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBHomeViewController.h"

@interface CBHomeViewController ()

@end

@implementation CBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStoryboard* storyboard1 = [UIStoryboard storyboardWithName:@"LLMShare" bundle:nil];
    
    //UIViewController *firstViewController = [[RDVFirstViewController alloc] init];
    UINavigationController *firstViewController = [storyboard1 instantiateViewControllerWithIdentifier:@"sharenav"];
    
    UIStoryboard* storyboard2 = [UIStoryboard storyboardWithName:@"LLMDate" bundle:nil];
    
    UINavigationController *secondViewController = [storyboard2 instantiateViewControllerWithIdentifier:@"datenav"];
    
    UIStoryboard* storyboard3 = [UIStoryboard storyboardWithName:@"LLMTool" bundle:nil];
    UINavigationController *thirdViewController = [storyboard3 instantiateViewControllerWithIdentifier:@"toolnav"];
    
    [self setViewControllers:@[firstViewController, secondViewController,
                               thirdViewController]];
    ;
    
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"bottom_btn1", @"bottom_btn2", @"bottom_btn3"];
    NSArray *tabBarItemTitles = @[@"分享", @"一起约", @"烧烤工具"];
    
    RDVTabBar *tabBar = [self tabBar];
    
    [tabBar setFrame:CGRectMake(CGRectGetMinX(tabBar.frame), CGRectGetMinY(tabBar.frame), CGRectGetWidth(tabBar.frame), 50)];
    
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
