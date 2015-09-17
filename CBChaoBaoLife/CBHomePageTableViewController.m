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

#define kMargin 8.f
#define kLMargin 20.f
#define kUMargin 40.f
#define Bnumber 6
#define bWidth 140.f
#define bHeight 140.f

@interface CBHomePageTableViewController ()

@end

@implementation CBHomePageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView * background = [[UIImageView alloc]init];
    [background setImage:[UIImage imageNamed:@"Default-1"]];
    self.tableView.backgroundView = background;
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
    CBHomePageHeader*headerview=[CBHomePageHeader CBHomePageHeader];
    [cell addSubview:headerview];
   headerview .frame=CGRectMake(0, 0, self.view.frame.size.width, 160.f);
    for (int i=0; i<Bnumber ;i++) {
        UIButton*button=[[UIButton alloc]init];
        CGFloat colum=i%2;
        CGFloat roum=i/2;
        if (colum==1) {
            
            button.frame=CGRectMake(self.view.center.x+kLMargin, headerview.bottom+kUMargin+(bHeight+kUMargin)*roum+50.f, bWidth, bHeight);
        }else{
            button.frame=CGRectMake(self.view.center.x-kLMargin-bWidth, headerview.bottom+kUMargin+(bWidth+kUMargin)*roum, bWidth, bHeight);
        }
        [cell addSubview:button];
        [button setBackgroundColor:[UIColor redColor]];
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"finditem_ad1-%d",i+1]] forState:UIControlStateNormal];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 750.f;
}

@end
