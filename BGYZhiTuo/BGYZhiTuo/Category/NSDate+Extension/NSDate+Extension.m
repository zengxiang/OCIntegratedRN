//
//  NSDate+Extension.m
//  BGYXMJL
//
//  Created by 邓伟权 on 2017/8/16.
//  Copyright © 2017年 mills. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)


+ (NSString *)dateWithDate:(NSDate *)date formater:(NSString *)formater
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = formater;
    
    return [format stringFromDate:date];
    
}

+ (NSInteger)getTimeStamp {
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a = [date timeIntervalSince1970] * 1000; // *1000 是精确到毫秒，不乘就是精确到秒
    
    return (NSInteger)a;
}

+ (NSString *)getTimeStampString {
    NSInteger timeStamp = [self getTimeStamp];
    
    return [NSString stringWithFormat:@"%ld", timeStamp];
}

@end
