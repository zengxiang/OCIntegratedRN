//
//  NSDictionary+Extension.h
//  BGYXMJL
//
//  Created by mills on 2017/6/9.
//  Copyright © 2017年 mills. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extension)


/**
 替换字典里的空值为空字符串

 @return 字典
 */
- (NSDictionary *)replaceAllNullValue;


/**
 json转字典

 @param json json字符串
 @return json 转成的字典
 */
+ (NSDictionary *)dictionaryWithJson:(NSString *)json;

@end
