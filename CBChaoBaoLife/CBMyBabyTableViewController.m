//
//  CBMyBabyTableViewController.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBMyBabyTableViewController.h"
#import "CBMineHeaderView.h"
@interface CBMyBabyTableViewController ()

@end

@implementation CBMyBabyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CBMineHeaderView*headerview=[CBMineHeaderView CBMineHeaderView];
    headerview.frame=CGRectMake(0, 0, self.view.frame.size.width, 200.f);
    self.tableView.tableHeaderView=headerview;
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(set:)];
    
}

-(void)set:(UIBarButtonItem*)item{
    [self performSegueWithIdentifier:@"toset" sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    // Return the number of sections.
//    return 3;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    // Return the number of rows in the section.
//    if (section==0) {
//        return 1;
//    }else{
//    return 3;
//    }
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CBMyBabyCell" forIndexPath:indexPath];
//    
//    
//    return cell;
//}


@end
