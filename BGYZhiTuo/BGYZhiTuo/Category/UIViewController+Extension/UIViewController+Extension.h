//
//  UIViewController+Extension.h
//  BasicFramework
//
//  Created by mills on 17/4/1.
//  Copyright © 2017年 mills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)

/**
 * 根据storyboardName和storyboardID跳转到相应的视图控制器
 *
 * @param sbName storyboardName
 * @param sbId   storyboardID
 */
-(void)jumpToViewControllerWithStoryboardName:(NSString *)sbName withStoryboardID:(NSString *)sbId;

/**
 * 根据storyboardName和storyboardID获取相应的视图控制器
 *
 * @param sbName storyboardName
 * @param sbId   storyboardID
 *
 * @return 相应的视图控制器
 */
-(UIViewController *)getViewControllerWithStoryboardName:(NSString *)sbName withStoryboardID:(NSString *)sbId;

/**
 * 根据storyboardName和storyboardVCName获取相应的视图控制器
 *
 * @param sbName storyboardName
 * @param vcName   storyboardVCName
 *
 * @return 相应的视图控制器
 */
-(UIViewController *)getViewControllerWithStoryboardName:(NSString *)sbName withStoryboardVCName:(NSString *)vcName;

@end
