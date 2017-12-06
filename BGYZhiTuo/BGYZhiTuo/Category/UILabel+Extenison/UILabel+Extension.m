//
//  UILabel+Extension.m
//  BGYXMJL
//
//  Created by Ethan Guo on 2017/10/18.
//  Copyright © 2017年 mills. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

+ (UILabel *)initializeLabelWithFont:(UIFont *)font
                           textColor:(UIColor *)color
                       textAlignment:(NSTextAlignment)alignment
                                text:(NSString *)text {
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = color;
    label.textAlignment = alignment;
    label.text = text ? text : @"";
    
    return label;
}

@end
