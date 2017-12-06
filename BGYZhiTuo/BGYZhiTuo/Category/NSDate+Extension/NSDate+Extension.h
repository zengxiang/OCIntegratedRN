//
//  NSDate+Extension.h
//  BGYXMJL
//
//  Created by 邓伟权 on 2017/8/16.
//  Copyright © 2017年 mills. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

+ (NSString *)dateWithDate:(NSDate *)date formater:(NSString *)formater;

+ (NSInteger)getTimeStamp;

+ (NSString *)getTimeStampString;


@end
