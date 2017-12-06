//
//  CALayer+UIColor.m
//  BGYXMJL
//
//  Created by mills on 2017/4/11.
//
//

#import "CALayer+UIColor.h"

@implementation CALayer (UIColor)

- (void)setBorderColorFromUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

@end
