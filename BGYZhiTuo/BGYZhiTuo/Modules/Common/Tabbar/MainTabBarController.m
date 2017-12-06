//
//  MainTabBarController.m
//  Yueshijia
//
//  Created by CosyVan on 2016/11/20.
//  Copyright © 2016年 Jeffery. All rights reserved.
//

#import "MainTabBarController.h"

#import "MyTabBar.h"
#import "NavigationViewController.h"
#import "HomeViewController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeViewController *homeVC = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    homeVC.title =    @"首页";
;
    [self addChildVC:homeVC imageName:@"tabbar_home_icon_unselect" selectedImageName:@"tabbar_home_icon_select"];
    
    UIViewController *specialVC = [[UIViewController alloc] init];
    specialVC.title =    @"sub";
    [self addChildVC:specialVC imageName:@"tabbar_home_icon_unselect" selectedImageName:@"tabbar_home_icon_select"];

    
    UIViewController *storeVC = [[UIViewController alloc] init];
    storeVC.title =    @"sub";
    [self addChildVC:storeVC imageName:@"tabbar_home_icon_unselect" selectedImageName:@"tabbar_home_icon_select"];

    
    UIViewController *storeVC1 = [[UIViewController alloc] init];
    storeVC1.title =    @"sub";
    [self addChildVC:storeVC1 imageName:@"tabbar_home_icon_unselect" selectedImageName:@"tabbar_home_icon_select"];
//    BasketViewController *basketVC = [[BasketViewController alloc] init];
//    basketVC.title = @"购物篮";
//    [self addChildVC:basketVC imageName:@"YS_car_nor" selectedImageName:@"YS_car_sel"];
//    
//    
//    MeViewController *meVC = [[MeViewController alloc] init];
//    meVC.title = @"我";
//    [self addChildVC:meVC imageName:@"YS_mine_nor" selectedImageName:@"YS_mine_sel"];
    
    
    MyTabBar *myTabBar = [[MyTabBar alloc] init];
    
    myTabBar.backgroundColor =[UIColor whiteColor];
    [self setValue:myTabBar forKey:@"tabBar"];
}

- (void)addChildVC:(UIViewController *)childVc imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    
    //设置文字样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = HEXCOLOR(0x666666);
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = HEXCOLOR(0x333333);
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 添加为tabbar控制器的子控制器
    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
}



@end
