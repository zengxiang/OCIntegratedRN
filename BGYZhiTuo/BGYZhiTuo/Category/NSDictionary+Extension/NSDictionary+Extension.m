//
//  NSDictionary+Extension.m
//  BGYXMJL
//
//  Created by mills on 2017/6/9.
//  Copyright © 2017年 mills. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)

- (NSDictionary *)replaceAllNullValue{
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] init];
    for (NSString *keyStr in self.allKeys) {
        if ([[self objectForKey:keyStr] isEqual:[NSNull null]]) {
            [mutableDic setObject:@"" forKey:keyStr];
        }
        else{
            [mutableDic setObject:[self objectForKey:keyStr] forKey:keyStr];
        }
    }
    return mutableDic;
}

+ (NSDictionary *)dictionaryWithJson:(NSString *)json
{
    if (!json || json.length==0) return nil;
    
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    
    if (error) {
        NSLog(@"%@", error);
        return nil;
    }
    
    return dict;
}

@end
