//
//  NSString+DateTransform.m
//  UI14-QQ聊天界面
//
//  Created by hegf on 15/8/27.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NSString+DateTransform.h"

@implementation NSString (DateTransform)
+(instancetype)HMSWithDate:(NSDate *)date{
    if (date == nil) {
        date = [NSDate date];
    }
    //辅助我们取时间的类，通过它设置想要取得时间的格式，来返回给你相应格式的时间
    NSDateFormatter* formater = [[NSDateFormatter alloc]init];
    [formater setDateFormat:@"HH:mm:ss"];
    NSString* dateString = [formater stringFromDate:date];
    return dateString;
}

+(instancetype)HMWithDate:(NSDate *)date{
    if (date == nil) {
        date = [NSDate date];
    }
    
    //辅助我们取时间的类，通过它设置想要取得时间的格式，来返回给你相应格式的时间
    NSDateFormatter* formater = [[NSDateFormatter alloc]init];
    [formater setDateFormat:@"HH:mm"];
    NSString* dateString = [formater stringFromDate:date];
    return dateString;
}

+(instancetype)YMDithDate:(NSDate *)date{
    if (date == nil) {
        date = [NSDate date];
    }
    //辅助我们取时间的类，通过它设置想要取得时间的格式，来返回给你相应格式的时间
    NSDateFormatter* formater = [[NSDateFormatter alloc]init];
    [formater setDateFormat:@"yyyy-MM-dd"];
    NSString* dateString = [formater stringFromDate:date];
    return dateString;
}

//如果传入的日期是同一天，显示今天 如果早一天 昨天 显示到前天，在网前正常显示
+(instancetype)YMDHMWithDate:(NSDate *)date{
    if (date == nil) {
        date = [NSDate date];
    }
    NSString* dateString = nil;
    
    //把传入的date和当前时间进行比较
    NSDateFormatter* formater = [[NSDateFormatter alloc]init];
    [formater setDateFormat:@"yyyy-MM-dd"];
    NSString *todayString = [formater stringFromDate:[NSDate date]];
    
    NSDate* today = [formater dateFromString:todayString];
    
    NSTimeInterval timeRange = [date timeIntervalSinceDate:today];
    if (timeRange < 0) {
        timeRange = ABS(timeRange);
        int day = (int)(timeRange/(24.f*60.f*60.f));
        switch (day) {
            case 0:
            {
                //今天 11:23
                dateString = [NSString stringWithFormat:@"今天 %@", [NSString HMWithDate:date]];
            }
                break;
            case 1:
            {
                //昨天 11:23
                dateString = [NSString stringWithFormat:@"昨天 %@", [NSString HMWithDate:date]];
            }
                break;
            case 2:
            {
                //前天 11:23
                dateString = [NSString stringWithFormat:@"前天 %@", [NSString HMWithDate:date]];
            }
                break;
                
            default:
            {
                NSDateFormatter* formater = [[NSDateFormatter alloc]init];
                [formater setDateFormat:@"yyyy-MM-dd HH:mm"];
                dateString = [formater stringFromDate:date];
            }
                break;
        }
    }
    //辅助我们取时间的类，通过它设置想要取得时间的格式，来返回给你相应格式的时间

    return dateString;
}

@end
