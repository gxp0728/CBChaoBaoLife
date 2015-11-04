//
//  CBCoreDataCostumeTool.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/10/11.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBCoreDataCostumeTool.h"
#import "AppDelegate.h"
//static CBTabBarHiddenTool* tool;
static CBCoreDataCostumeTool *tool;
@implementation CBCoreDataCostumeTool


+(instancetype)shareCoreDataCostumeTool{
//    static dispatch_once_t once;
//    dispatch_once(&once, ^{
//        tool = [[CBTabBarHiddenTool alloc]init];
//    });
//    return tool;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        tool = [[CBCoreDataCostumeTool alloc]init];
    });
    return tool;
    
}

+(NSArray *)searchCostume{
    AppDelegate* delegate = [UIApplication sharedApplication].delegate;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *desc = [NSEntityDescription entityForName:@"CBCostumeMatching" inManagedObjectContext:delegate.managedObjectContext];
    request.entity = desc;
    
    //    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES];
    //    request.sortDescriptors = [NSArray arrayWithObject:sort];
    
    NSError *error = nil;
    NSArray *objs = [delegate.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    return objs;
}
@end
