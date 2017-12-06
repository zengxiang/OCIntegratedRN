//
//  HomeViewController.m
//  BGYZhiTuo
//
//  Created by 曾祥 on 2017/11/22.
//  Copyright © 2017年 曾祥. All rights reserved.
//

#import "HomeViewController.h"
#import "LocationManager.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import "UIView+Toast.h"
#import "RNManagerVC.h"
#import <React/RCTRootView.h>
#import <CodePush/CodePush.h>
@interface HomeViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>
{
    BMKMapView* _mapView;
    BMKLocationService *_locService;
    BMKPolyline* polyline;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    _mapView =[[BMKMapView alloc]initWithFrame:CGRectMake(0, Nav_height, Screen_width, Screen_height - Nav_height)];
//    _mapView.delegate = self;
//    _mapView.zoomLevel = 13;
    [self.view addSubview:_mapView];
    
    
    
    BMKLocationViewDisplayParam *userlocationStyle = [[BMKLocationViewDisplayParam alloc] init];
//    //精度圈是否显示
//    userlocationStyle.isRotateAngleValid = NO;
//    //跟随态旋转角度是否生效
////    userlocationStyle.isAccuracyCircleShow = NO;
//    //定位图标
////    userlocationStyle.locationViewImgName = [UIImage imageNamed:@"图标名称"];
//    //更新参样式信息
//    [_mapView updateLocationViewWithParam:userlocationStyle];
    
  
    
    dispatch_async(dispatch_get_main_queue(), ^{
        _mapView.showsUserLocation = YES;//显示定位图层
        _mapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态为普通定位模式
        [[LocationManager shareInstance] startLoc];
    });
    
    
    
    UIButton *btn =[UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = CGRectMake(50, Nav_height +20, 50, 50);
    btn.backgroundColor =[UIColor redColor];
    [btn setTitle:@"定位" forState:0];
    [btn addTarget:self action:@selector(doTaploc) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    kWeakSelf(self);
    [LocationManager shareInstance].StartLocSuccessBlock = ^{
        [weakself updataBMKMapView];
    };
    // Do any additional setup after loading the view from its nib.
}

- (void)updataBMKMapView
{
    [_mapView updateLocationData: [LocationManager shareInstance].myUserLocation];
    
    if (polyline) {
        [_mapView removeOverlay:polyline];
    }
    NSArray *   lineLocArray =[[NSUserDefaults standardUserDefaults] objectForKey:@"LoctionArray"];
    if (lineLocArray.count > 0) {
        CLLocationCoordinate2D *coloredPolylineCoords = malloc([lineLocArray count] * sizeof(CLLocationCoordinate2D));
        
        
        NSMutableArray *array1=[NSMutableArray array];
        for (int i = 0; i < lineLocArray.count; i ++) {
            NSArray *locArray = [lineLocArray[i] componentsSeparatedByString:@","];
            if (locArray.count == 2) {
                
                coloredPolylineCoords[i].latitude =[locArray[1] doubleValue];
                coloredPolylineCoords[i].longitude =[locArray[0] doubleValue];
                
                BMKPointAnnotation * point =[[BMKPointAnnotation alloc]init];
                point.coordinate = coloredPolylineCoords[i];
                [array1 addObject:point];
            }
            
        }
        
        [_mapView showAnnotations:array1 animated:YES];
        polyline = [BMKPolyline polylineWithCoordinates:coloredPolylineCoords count:lineLocArray.count];
        [_mapView addOverlay:polyline];
    }
}

- (BOOL)ChackOpenLoc
{
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse)) {
        return YES;
    }
    
    UIAlertController *alertVC =[UIAlertController alertControllerWithTitle:@"智拓想要使用您的定位功能" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
    
    [alertVC addAction: [UIAlertAction actionWithTitle:@"不允许" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }]];
    [self presentViewController:alertVC animated:YES completion:nil];
    return NO;
    
}
- (void)doTaploc
{
//    if (![self ChackOpenLoc]) {
//        return;
//    }
//
////    [self.navigationController pushViewController:[BaseVC new] animated:YES];
//    [[LocationManager shareInstance] startLoc];
//    _mapView.showsUserLocation = NO;
//    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
//    _mapView.showsUserLocation = YES;
    
    
    NSURL *jsCodeLocation = nil;
    //#ifdef DEBUG
    //    http://localhost:8081
    //    http://192.168.1.103:8081
//#ifdef DEBUG
//    jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios&dev=true"];
//#else
    jsCodeLocation = [CodePush bundleURLForResource:@"SPRNProject" withExtension:@"jsbundle"];
//#endif

    
    NSLog(@"jump RN");
    // 因为要用到http, 要排除localhost域名，或者打开ATS
    // 传给RN的参数必须是字典类型，要和js代码propertis一致
    NSDictionary *params = @{@"scores" : @[
                                     @{@"name" : @"Alex",
                                       @"value": @"42"},
                                     @{@"name" : @"Joel",
                                       @"value": @"10"}
                                     ]
                             };
    // moduleName 要对应index.ios.js 上的 AppRegistry module
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL : jsCodeLocation
                                                 moduleName        : @"RNTestViewModule"
                                                 initialProperties : params
                                                  launchOptions    : nil];
    
    // RN管理VC
    RNManagerVC *vc = [[RNManagerVC alloc] initWithBack:^(id rnParams) {
        // 返回回调
        NSLog(@"params %@",rnParams);
        if ([rnParams isKindOfClass:[NSDictionary class]]) {
        }
        
    } Next:^(UIViewController *vc, id rnParams) {
        // 跳转VC回调
        NSLog(@"params %@",rnParams);
    }];
    // 赋值RN的view到VC中view(必须)
    vc.view = rootView;
    vc.title = @"承载RN视图的VC";
    // 去掉返回箭头的title
    UIBarButtonItem *item = [[UIBarButtonItem alloc] init];
    item.title = @"";
    self.navigationItem.backBarButtonItem = item;
    [self.navigationController pushViewController:vc animated:YES];
    //    [self presentViewController:vc animated:YES completion:nil];
    
}

- (void)dealloc {
    if (_mapView) {
        _mapView = nil;
    }
}
// Override
- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id <BMKOverlay>)overlay{
    if ([overlay isKindOfClass:[BMKPolyline class]]){
        BMKPolylineView* polylineView = [[BMKPolylineView alloc] initWithOverlay:overlay];
        polylineView.strokeColor = [UIColor redColor];
        polylineView.lineWidth = 2.0;
        
        return polylineView;
    }
    return nil;
}


-(void)viewWillAppear:(BOOL)animated {
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    [BMKMapView enableCustomMapStyle:NO];

}

-(void)viewWillDisappear:(BOOL)animated {
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
