//
//  CBCostumeMatchingTableViewController.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/17.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBCostumeMatchingTableViewController.h"
#import "CBCostumeMatchingTableViewCell.h"
#import "CBCostumeMatching.h"
#import "CBCoreDataCostumeTool.h"
#import <Parse.h>
#import "CBProDetailsoViewController.h"
#import "MBProgressHUD+MoreExtersion.h"
#import <MJRefresh.h>
@interface CBCostumeMatchingTableViewController ()
@property(strong,nonatomic)NSMutableArray *imagearray;

@end

@implementation CBCostumeMatchingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadMoreImage)];
    
    // 马上进入刷新状态
    [self.tableView.header beginRefreshing];
    
    
    if (_costumeArray == nil || _costumeArray.count == 0) {
        [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow LableText:@"正在加载中" animated:nil];
        [self.tableView reloadData];
    }else {
        return;
    }
   
    
}

-(void)loadMoreImage{
    
    PFQuery *query = [PFQuery queryWithClassName:@"CBCostumeMatching"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if (!error) {
            //Everything was correct, put the new objects and load the wall
            self.imagearray = nil;
            self.imagearray = [[NSMutableArray alloc] initWithArray:objects];
            //            for (int i =0; i<_imageArray.count; i++) {
            //                _imageModel =[CBCostumeMatchingModel costumeMatchingWithDict:_imageArray[i]];
            //            }
            [MBProgressHUD hideHUDForView:self.tableView animated:YES];
        } else {
            
            //4
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
}

#pragma mark 懒加载数组
-(NSMutableArray *)imagearray{
    if (_imagearray ==nil) {
        _imagearray = [NSMutableArray array];
        for ( int i=0; i<_costumeArray.count; i++) {
            _costumeModel = [CBCostumeMatchingModel costumeMatchingWithDict:_costumeArray[i]];
            [_imagearray addObject:_costumeModel];
        }
        
    }
    return _imagearray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.imagearray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CBCostumeMatchingTableViewCell *cell = [CBCostumeMatchingTableViewCell CostumeMatchingTableViewCellWithTableView:tableView];

    cell.costume = self.imagearray[indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:236.f/255.f green:236.f/255.f blue:241.f/255.f alpha:1];
   cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark 跳转详情页面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CBCostumeMatchingModel *model = self.imagearray[indexPath.row];
    [self performSegueWithIdentifier:@"todetail" sender:model];
    
}

#pragma mark 切换时调用的函数
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    CBProDetailsoViewController *vc = [[CBProDetailsoViewController alloc]init];
    vc = segue.destinationViewController;
    vc.model = sender;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300.f;
}


@end
