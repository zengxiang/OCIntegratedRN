//
//  CALayer+UIColor.h
//  BGYXMJL
//
//  Created by mills on 2017/4/11.
//
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (UIColor)


/**
 主要用于控件的边框颜色

 @param color 颜色
 */
- (void)setBorderColorFromUIColor:(UIColor *)color;


@end
