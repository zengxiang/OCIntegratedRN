//
//  UIColor+Extension.h
//  BGYXMJL
//
//  Created by aaron on 2017/10/20.
//  Copyright © 2017年 mills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
/**
 *  @brief  通过hexColor得到一个UIColor
 *
 *  @param color hexColor @example #FFFFFF或者FFFFFF或者0XFFFFFF
 *
 *  @return UIColor alpha为1.f
 */
+ (UIColor*)colorWithHexadecimal:(NSString *)color;
+ (UIColor*)colorWithHexadecimal:(NSString *)color alpha:(CGFloat)alphaValue;
@end
