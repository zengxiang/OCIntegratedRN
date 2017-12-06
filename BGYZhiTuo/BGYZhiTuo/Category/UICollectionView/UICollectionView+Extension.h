//
//  UICollectionView+Extension.h
//  BGYXMJL
//
//  Created by mills on 2017/7/3.
//  Copyright © 2017年 mills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (Extension)

- (void)registerCellWithName:(NSString *)name;

- (__kindof UICollectionViewCell *)reusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

- (void)registerHeaderViewWithClass:(Class)viewClass Name:(NSString *)name;

- (void)registerFooterViewWithClass:(Class)viewClass Name:(NSString *)name;

- (void)registerHeaderViewWithName:(NSString *)name;

- (void)registerFooterViewWithName:(NSString *)name;

@end
