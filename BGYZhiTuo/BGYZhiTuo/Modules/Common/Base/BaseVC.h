//
//  BaseVC.h
//  BGYZhiTuo
//
//  Created by 曾祥 on 2017/11/21.
//  Copyright © 2017年 曾祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseVC : UIViewController
{
    UIView *navView ;
    UIButton *leftBtn;
    UIButton *rightBtn;
    UILabel *l_navTitle;
}


@property(nonatomic,assign)BOOL isModel;

@property(nonatomic,copy) void(^UpdataUIWithBaseBlock)(void);

@property(nonatomic,copy) void(^SelectWithBaseBlock)(id obj);


- (void)doTapLeft;
- (void)doTapRight;


-(void)setRightBtnTitle:(NSString *)title colcor:(UIColor *)color;
- (void)setNavViewClearColor;
-(void)setLeftBtnTitle:(NSString *)title colcor:(UIColor *)color;;


-(void)addKeyboardDownTapRecognizerWithView:(UIView *)view;

@end
