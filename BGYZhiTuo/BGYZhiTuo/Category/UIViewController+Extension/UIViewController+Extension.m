//
//  UIViewController+Extension.m
//  BasicFramework
//
//  Created by mills on 17/4/1.
//  Copyright © 2017年 mills. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

-(void)jumpToViewControllerWithStoryboardName:(NSString *)sbName withStoryboardID:(NSString *)sbId{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:sbId];
    [self.navigationController pushViewController:vc animated:YES];
}

-(UIViewController *)getViewControllerWithStoryboardName:(NSString *)sbName withStoryboardID:(NSString *)sbId{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:sbId];
}

-(UIViewController *)getViewControllerWithStoryboardName:(NSString *)sbName withStoryboardVCName:(NSString *)vcName{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:[NSString stringWithFormat:@"%@ID",vcName]];
}

@end
