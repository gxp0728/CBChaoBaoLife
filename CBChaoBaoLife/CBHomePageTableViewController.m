//
//  CBHomePageTableViewController.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBHomePageTableViewController.h"
#import "CBHomePageHeader.h"
#import "UIView+Extension.h"
#import "CBHmePageViewController.h"
#import <RDVTabBarController.h>
#import <RDVTabBarItem.h>
#import "CBTabBarHiddenTool.h"
#import "CBCostumeMatchingTableViewCell.h"
#import "CBCostumeMatchingTableViewController.h"
#import "CBCostumeMatchingModel.h"
#import "CBCoreDataCostumeTool.h"
#import "MBProgressHUD+MoreExtersion.h"
#define kMargin 8.f
#define kLMargin 20.f
#define kUMargin 40.f
#define Bnumber 6
#define bWidth 140.f
#define bHeight 140.f

@interface CBHomePageTableViewController ()

@property (strong ,nonatomic)CBCostumeMatchingModel *imageModel;
@property (strong,nonatomic)NSMutableArray *imageArray;
@end

@implementation CBHomePageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *background = [[UIImageView alloc]init];
  [background setImage:[UIImage imageNamed:@"Default-1"]];
    self.tableView.backgroundView = background;
    PFQuery *query = [PFQuery queryWithClassName:@"CBCostumeMatching"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    
        if (!error) {
            self.imageArray = nil;
            self.imageArray = [[NSMutableArray alloc] initWithArray:objects];
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        } else {
            
            //4
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CBHomecell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    CBHomePageHeader *headerview = [CBHomePageHeader CBHomePageHeader];
    [cell addSubview:headerview];
   headerview .frame = CGRectMake(0, 0, self.view.frame.size.width, 160.f);
    for (int i=0; i<Bnumber ;i++) {
        UIButton *button = [[UIButton alloc]init];
        button.layer.cornerRadius = 10.f;
        button.layer.masksToBounds = YES;
        [button addTarget:self action:@selector(enter:) forControlEvents:UIControlEventTouchUpInside];
        CGFloat colum = i%2;
        CGFloat roum = i/2;
        if (colum==1) {
            
            button.frame = CGRectMake(((((self.view.frame.size.width/2)-bWidth)/2)+self.view.frame.size.width/2), headerview.bottom+kUMargin+(bHeight+kUMargin)*roum+50.f, bWidth, bHeight);
        }else{
            button.frame = CGRectMake((((self.view.frame.size.width/2)-bWidth)/2), headerview.bottom+kUMargin+(bWidth+kUMargin)*roum, bWidth, bHeight);
            
        }
        [cell addSubview:button];
        
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"finditem_ad1-%d",i+1]] forState:UIControlStateNormal];
    }
    
    return cell;
}

#pragma mark 进入功能页
-(void)enter:(UIButton*)sender{
    [self performSegueWithIdentifier:@"tofupage" sender:sender];
    [[CBTabBarHiddenTool shareCBTabBarHiddenTool]hiddenTabBar];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[CBTabBarHiddenTool shareCBTabBarHiddenTool]showTabBar];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 770.f;
}

@end
