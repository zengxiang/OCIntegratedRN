//
//  LocationManager.h
//  BGYZhiTuo
//
//  Created by 曾祥 on 2017/11/22.
//  Copyright © 2017年 曾祥. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BMKUserLocation;
@interface LocationManager : NSObject
{
    
}

@property(nonatomic,strong)BMKUserLocation *myUserLocation;

+(instancetype) shareInstance;

- (void)startLoc;



@property(nonatomic,copy)  void (^StartLocSuccessBlock)(void);
@end
