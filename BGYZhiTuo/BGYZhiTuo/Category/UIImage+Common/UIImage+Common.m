//
//  UIImage+Common.m
//  FrameworkSuxx
//
//  Created by suxx on 16/5/26.
//  Copyright © 2016年 suxx. All rights reserved.
//

#import "UIImage+Common.h"

@implementation UIImage (Common)

+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIImage *)imageWithName:(NSString *)name withType:(NSString *)type{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:name ofType:type];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    
    return image;
}

-(UIImage*)scaleToSize:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage*scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

+ (instancetype)captureWithView:(UIView *)view
{
    // 1.开启图形上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
    
    // 2.获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 3.渲染图层
    [view.layer renderInContext:ctx];
    
    // 4.获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5.关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

@end
