//
//  BgyDefine.h
//  BGYZhiTuo
//
//  Created by 曾祥 on 2017/11/16.
//  Copyright © 2017年 曾祥. All rights reserved.
//

#ifndef BgyDefine_h
#define BgyDefine_h

// 颜色
#define HEXCOLOR(hexValue) [UIColor colorWithRed:((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0 green:((CGFloat)((hexValue & 0xFF00) >> 8))/255.0 blue:((CGFloat)(hexValue & 0xFF))/255.0 alpha:1.0]
#define HEXACOLOR(hexValue, alphaValue) [UIColor colorWithRed:((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0 green:((CGFloat)((hexValue & 0xFF00) >> 8))/255.0 blue:((CGFloat)(hexValue & 0xFF))/255.0 alpha:(alphaValue)]
#define RGBCOLOR(r,g,b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define ARGBCOLOR(r,g,b,a)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
// 界面
#define Screen_height  [[UIScreen mainScreen] bounds].size.height
#define Screen_width  [[UIScreen mainScreen] bounds].size.width
#define HEIGHT_PRO(Y) (Y)*(Screen_width/375.00)


// 判断是否是iPhone X
#define IsIPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 状态栏高度
#define STATUS_BAR_HEIGHT (IsIPhoneX ? 44.f : 20.f)
// 导航栏高度
#define Nav_height (IsIPhoneX ? 88.f : 64.f)
// tabBar高度
#define Tab_height (IsIPhoneX ? (49.f+34.f) : 49.f)
// home indicator
#define HOME_INDICATOR_HEIGHT (IsIPhoneX ? 34.f : 0.f)

/**
 主题色
 */
#define MainColor  HEXCOLOR(0X10B9DD)

#define BGYBaseURL @"http://www.baidu.com"
#define AppStoreUrl @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=921508252"

//强弱引用
#define kWeakSelf(type)__weak typeof(type)weak##type = type;
#define kStrongSelf(type)__strong typeof(type)type = weak##type;

#define postNotification(actionName, obj)                {NSNotification *notification = [NSNotification notificationWithName:actionName object:obj]; [[NSNotificationCenter defaultCenter]postNotification:notification]; }
#define addSelfAsNotificationObserver(actionName, SEL)    {[[NSNotificationCenter defaultCenter]addObserver:self selector:SEL name:actionName object:nil]; }

#define removeSelfNofificationObservers {[[NSNotificationCenter defaultCenter] removeObserver:self]; }



#endif /* BgyDefine_h */
