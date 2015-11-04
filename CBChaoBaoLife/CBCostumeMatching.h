//
//  CBCostumeMatching.h
//  CBChaoBaoLife
//
//  Created by neuedu on 15/10/13.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CBCostumeMatching : NSManagedObject

@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * images;

+(instancetype)costumeMatchingWithDict:(NSDictionary *)dict;
@end
