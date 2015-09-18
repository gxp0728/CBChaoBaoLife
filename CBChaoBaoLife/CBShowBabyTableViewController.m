//
//  CBShowBabyTableViewController.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBShowBabyTableViewController.h"
#import "CBShowBabyTableViewCell.h"
#import "CBShowBabyFrameModel.h"
@interface CBShowBabyTableViewController ()
@property(strong,nonatomic)NSMutableArray*shows;
@end

@implementation CBShowBabyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 懒加载
-(NSMutableArray *)shows{
    if (_shows==nil) {
        _shows=[NSMutableArray array];
        NSArray*dict=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test.plist" ofType:nil]];
        for (int i=0; i<dict.count; i++) {
            CBShowBabyModel*show=[CBShowBabyModel CBShowBabyModelWithDict:dict[i]];
            CBShowBabyFrameModel*showframe=[CBShowBabyFrameModel CBShowBabyFrameModelWithModel:show];
            [_shows addObject:showframe];
        }
        
    }
    return _shows;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.shows.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CBShowBabyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"showCell" forIndexPath:indexPath];
   
    // Configure the cell...
    cell.frameModel=self.shows[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CBShowBabyFrameModel*showframe=self.shows[indexPath.row];
    return showframe.cellHeight;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
