//
//  UIButton+EnlargeTouchArea.h
//  test1
//
//  Created by mills on 2017/5/24.
//  Copyright © 2017年 mills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (EnlargeTouchArea)


/**
 扩大按钮点击区域

 @param top 上
 @param right 右
 @param bottom 下
 @param left 左
 */
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

@end
