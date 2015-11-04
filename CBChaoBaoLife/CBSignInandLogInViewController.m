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
#import "CBUserInfoMngTool.h"
#import <QuartzCore/QuartzCore.h>
@interface CBSignInandLogInViewController ()

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)signup:(UIButton *)sender;

@end

@implementation CBSignInandLogInViewController

#pragma mark 登录
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
            [self getImageFileWithName:@"image"];
            NSString *name = [[NSUserDefaults standardUserDefaults]objectForKey:@"userName"];
            [CBUserInfoMngTool sharedCbUserInfoMngTool].userName = name;
            
        } else {
            //Something bad has ocurred

            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"账户名或密码错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
    

}

#pragma mark 从沙盒中取数据
-(UIImage*) getImageFileWithName:(NSString*)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString* filePath = [path stringByAppendingPathComponent:fileName];
    NSError* err = [[NSError alloc] init];
    NSData* data = [[NSData alloc] initWithContentsOfFile:filePath
                                                  options:NSDataReadingMapped
                                                    error:&err];
    UIImage* img = nil;
    if(data != nil)
    {
        img =[UIImage imageWithData:data];
        [CBUserInfoMngTool sharedCbUserInfoMngTool].image = img;
        
    }
    else
    {
        NSLog(@"getImageFileWithName error code : %ld",(long)[err code]);
    }
    return img;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)signup:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"tosignin" sender:nil];
    
}
@end
