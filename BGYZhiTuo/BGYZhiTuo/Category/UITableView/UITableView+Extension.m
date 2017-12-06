//
//  UITableView+Extension.m
//  BGYXMJL
//
//  Created by mills on 2017/7/3.
//  Copyright © 2017年 mills. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)

- (void)registerCellWithName:(NSString *)name{
    [self registerNib:[UINib nibWithNibName:name bundle:nil] forCellReuseIdentifier:[NSString stringWithFormat:@"%@ID",name]];
}

- (nullable __kindof UITableViewCell *)reuseIdentifier:(NSString *)identifier{
    
    NSString *iden = [NSString stringWithFormat:@"%@ID",identifier];
    
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:iden];
    return cell;
}

@end
