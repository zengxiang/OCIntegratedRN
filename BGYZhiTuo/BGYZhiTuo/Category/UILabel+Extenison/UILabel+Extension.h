//
//  UILabel+Extension.h
//  BGYXMJL
//
//  Created by Ethan Guo on 2017/10/18.
//  Copyright © 2017年 mills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

+ (UILabel *)initializeLabelWithFont:(UIFont *)font
                           textColor:(UIColor *)color
                       textAlignment:(NSTextAlignment)alignment
                                text:(NSString *)text;

@end
