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
#import <Parse.h>
#import "CBSignInViewController.h"
@interface CBSignInandLogInViewController ()

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)signup:(UIButton *)sender;

@end

@implementation CBSignInandLogInViewController
- (IBAction)Login:(UIButton *)sender {
    
    PFUser *user = [PFUser user];
    //2
    user.username = _username.text;
    user.password = _password.text;
    
    //3
//    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (!error) {
//            //The registration was successful, go to the wall
//            // [self performSegueWithIdentifier:@"SignupSuccesful" sender:self];
////            NSLog(@"signUp sucess");
//           
//            UIAlertView*view=[[UIAlertView alloc]initWithTitle:@"提示" message:@"注册成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//            [view show];
//            
//        } else {
//            //Something bad has occurred
////            NSString *errorString = [[error userInfo] objectForKey:@"账号已存在"];
//            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"账号已存在" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//            [errorAlertView show];
//        }
//    }];
    [PFUser logInWithUsernameInBackground:_username.text   password:_password.text block:^(PFUser *user, NSError *error) {
        if (user) {
            //Open the wall

            CBHmePageViewController *mainnav=[[CBHmePageViewController alloc]init];
            [UIApplication sharedApplication].keyWindow.rootViewController=mainnav;
        } else {
            //Something bad has ocurred

            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"账户名或密码错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
    

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

- (IBAction)signup:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"tosignin" sender:nil];
    
}
@end
