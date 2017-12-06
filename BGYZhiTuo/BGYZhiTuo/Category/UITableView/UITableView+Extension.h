//
//  UITableView+Extension.h
//  BGYXMJL
//
//  Created by mills on 2017/7/3.
//  Copyright © 2017年 mills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Extension)


/**
 注册tableviewCell方法

 @param name 对应的Cell名字
 */
- (void)registerCellWithName:(NSString *_Nullable)name;

/**
 重用方法简写

 @param identifier 自定义Cell的ID
 @return 对应的cell
 */
- (nullable __kindof UITableViewCell *)reuseIdentifier:(NSString *_Nullable)identifier;

@end
