//
//  CBSignInandLogInViewController.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBSignInandLogInViewController.h"
#import "CBHmePageViewController.h"
#import "CBHomePageTableViewController.h"
@interface CBSignInandLogInViewController ()

@end

@implementation CBSignInandLogInViewController
- (IBAction)Login:(UIButton *)sender {
    CBHmePageViewController *mainnav=[[CBHmePageViewController alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController=mainnav;
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
