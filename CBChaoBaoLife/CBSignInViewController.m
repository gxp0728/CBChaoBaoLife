//
//  CBSignInViewController.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/10/7.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBSignInViewController.h"
#import <Parse.h>

@interface CBSignInViewController ()
- (IBAction)signin:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation CBSignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 注册
- (IBAction)signin:(UIButton *)sender {

    if (_password.text.length==0  || _account.text.length==0) {
        UIAlertView*view=[[UIAlertView alloc]initWithTitle:@"提示" message:@"账号或密码为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                          [view show];
        
    }else {
        PFUser *user = [PFUser user];
        //2
        user.username = _account.text;
        user.password = _password.text;
        
        //3
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                //The registration was successful, go to the wall
                
//                UIAlertView*view=[[UIAlertView alloc]initWithTitle:@"提示" message:@"注册成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//                [view show];
                [self.navigationController popToRootViewControllerAnimated:YES];
                
            } else {
                //Something bad has occurred
                
                UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"账号已存在" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [errorAlertView show];
                
            }
        }];

    }
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
