//
//  UICollectionView+Extension.m
//  BGYXMJL
//
//  Created by mills on 2017/7/3.
//  Copyright © 2017年 mills. All rights reserved.
//

#import "UICollectionView+Extension.h"

@implementation UICollectionView (Extension)

- (void)registerCellWithName:(NSString *)name{
    [self registerNib:[UINib nibWithNibName:name bundle:nil]forCellWithReuseIdentifier:[NSString stringWithFormat:@"%@ID",name]];
}

- (__kindof UICollectionViewCell *)reusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [self dequeueReusableCellWithReuseIdentifier:[NSString stringWithFormat:@"%@ID",identifier] forIndexPath:indexPath];
    return cell;
}

- (void)registerHeaderViewWithClass:(Class)viewClass Name:(NSString *)name{
    [self registerClass:viewClass forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[NSString stringWithFormat:@"%@ID",name]];
}

- (void)registerFooterViewWithClass:(Class)viewClass Name:(NSString *)name{
    [self registerClass:viewClass forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[NSString stringWithFormat:@"%@ID",name]];
}

- (void)registerHeaderViewWithName:(NSString *)name{
    [self registerNib:[UINib nibWithNibName:name bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[NSString stringWithFormat:@"%@ID",name]];
}

- (void)registerFooterViewWithName:(NSString *)name{
    [self registerNib:[UINib nibWithNibName:name bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[NSString stringWithFormat:@"%@ID",name]];
}

@end
