//
//  CBCostumeMatching.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/10/13.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBCostumeMatching.h"
#import "AppDelegate.h"

@implementation CBCostumeMatching

@dynamic image;
@dynamic name;
@dynamic images;

+(instancetype)costumeMatchingWithDict:(NSDictionary *)dict{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    CBCostumeMatching *costumeMatching = [NSEntityDescription insertNewObjectForEntityForName:@"CBCostumeMatching" inManagedObjectContext:delegate.managedObjectContext];
    costumeMatching.name = [dict objectForKey:@"name"];
    costumeMatching.image = [dict objectForKey:@"image"];
    costumeMatching.images = [dict objectForKey:@"images"];
    
    [delegate saveContext];
    
    return costumeMatching;
    
}
@end
