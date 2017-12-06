//
//  NSUserDefaults+Extension.h
//  BGYXMJL
//
//  Created by Ethan Guo on 2017/10/31.
//  Copyright © 2017年 mills. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Extension)

- (NSString *)getVersionForKey:(NSString *)key;
- (void)saveVersion:(NSInteger)newVersion key:(NSString *)key;

@end
