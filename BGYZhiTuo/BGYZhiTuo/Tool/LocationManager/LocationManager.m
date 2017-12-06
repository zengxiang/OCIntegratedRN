//
//  LocationManager.m
//  BGYZhiTuo
//
//  Created by 曾祥 on 2017/11/22.
//  Copyright © 2017年 曾祥. All rights reserved.
//

#import "LocationManager.h"
#import <BaiduMapAPI_Location/BMKLocationComponent.h>

@interface LocationManager()<BMKLocationServiceDelegate>
{
    BMKLocationService * MyBMKLocation;
    CLLocationManager *_locManager ;

}
@end

@implementation LocationManager
{
}

static LocationManager* _instance = nil;
+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    return _instance ;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [LocationManager shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [LocationManager shareInstance] ;
}
- (void)startLoc
{
    
    if (!_locManager) {
        _locManager = [[CLLocationManager alloc] init];
        if([_locManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
            [_locManager requestAlwaysAuthorization]; // 永久授权
            [_locManager requestWhenInUseAuthorization]; //使用中授权
//            [_locManager startMonitoringSignificantLocationChanges];
        };
    }
    
    
    if (MyBMKLocation ) {
        [MyBMKLocation stopUserLocationService];
    }else{
        MyBMKLocation = [[BMKLocationService alloc] init];
        MyBMKLocation.delegate = self;

        //    MyBMKLocation.coordinateType = BMKLocationCoordinateTypeBMK09LL;
        MyBMKLocation.distanceFilter = 100.0f;
        MyBMKLocation.desiredAccuracy = kCLLocationAccuracyBest;
//            MyBMKLocation.activityType = CLActivityTypeAutomotiveNavigation;
        MyBMKLocation.pausesLocationUpdatesAutomatically = NO;
        MyBMKLocation.allowsBackgroundLocationUpdates = YES;// YES的话是可以进行后台定位的，但需要项目配置，否则会报错，具体参考开发文档
    }
    [MyBMKLocation startUserLocationService];
    
}



/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
//    [_mapView updateLocationData:userLocation];
//    NSLog(@"heading is %@",userLocation.heading);
    
//    self.myUserLocation = userLocation;
//    if (self.StartLocSuccessBlock) {
//        self.StartLocSuccessBlock();
//    }
}


/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    
    
    self.myUserLocation = userLocation;
    if (self.StartLocSuccessBlock) {
        self.StartLocSuccessBlock();
    }
    CLLocationCoordinate2D  locCoordinate2D1 =  userLocation.location.coordinate;
    
//    SGWSingleton.locCoordinate2D = locCoordinate2D1;
//    NSString *location = [NSString stringWithFormat:@"%@,%@",[[NSDecimalNumber alloc] initWithDouble:locCoordinate2D1.longitude],[[NSDecimalNumber alloc] initWithDouble:locCoordinate2D1.latitude]];

    NSString *location = [NSString stringWithFormat:@"%.6f,%.6f",locCoordinate2D1.longitude,locCoordinate2D1.latitude];    
    NSMutableArray *array =[NSMutableArray array];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"LoctionArray"]) {
        [array addObjectsFromArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"LoctionArray"]];
    }
    if (array.count >0) {
        if (![array.lastObject isEqualToString:location]) {
            [array addObject:location];
        }
    }else{
        [array addObject:location];
    }
    [[NSUserDefaults standardUserDefaults] setValue:array forKey:@"LoctionArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}


/**
 *在地图View停止定位后，会调用此函数
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}

@end
