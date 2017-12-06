//
//  BaseController.m
//  TortoiseUniversity
//
//  Created by 神龟网 on 2017/3/5.
//  Copyright © 2017年 神龟网. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC


- (void)viewDidLoad {
    [super viewDidLoad];

    //self.enablePanGesture = YES;
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    navView =[[UIView alloc]initWithFrame:CGRectMake(0, IsIPhoneX?24:0, Screen_width, 64)];
    navView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:navView];
    
    
    UIView *line =[[UIView alloc]initWithFrame:CGRectMake(0, 63.5, Screen_width, 0.5)];
    line.backgroundColor =HEXCOLOR(0xC8C7CC);
    [navView addSubview:line];
    
    leftBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    leftBtn.size  = CGSizeMake(44, 44);
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    
    [leftBtn setImage:[UIImage imageNamed:@"f2u_back"] forState:(UIControlStateNormal)];
    [leftBtn addTarget:self action:@selector(doTapLeft) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:leftBtn];
    leftBtn.left = 0;
    leftBtn.top = 20;
    
    
    rightBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    rightBtn.size  = CGSizeMake(44, 44);
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [rightBtn setTitleColor:HEXCOLOR(0x484848) forState:(UIControlStateNormal)];
    
    [rightBtn addTarget:self action:@selector(doTapRight) forControlEvents:UIControlEventTouchUpInside];
    
    rightBtn.left = Screen_width-44-5;
    rightBtn.top = 20;
    
    [navView addSubview:rightBtn];
    
    
    l_navTitle =[[UILabel alloc]initWithFrame:CGRectMake(0, 20, Screen_width - 110, 44)];
    l_navTitle.textColor =HEXCOLOR(0x484848);
    //    l_navTitle.textColor =[UIColor whiteColor];
    l_navTitle.textAlignment = 1;
    //    l_navTitle.font =[UIFont fontWithName:@"Helvetica-Light" size:16.0];
    //    l_navTitle.font =[UIFont boldSystemFontOfSize:16.0];
    [navView addSubview:l_navTitle];
    
    l_navTitle.adjustsFontSizeToFitWidth = YES;
    
    l_navTitle.centerX = navView.width/2;
    
    // 添加折线覆盖物
    
  
    
}

-(void)setRightBtnTitle:(NSString *)title colcor:(UIColor *)color;
{
    [rightBtn setTitle:title forState:(UIControlStateNormal)];
    [rightBtn sizeToFit];
    rightBtn.right = Screen_width - 10;
    [rightBtn setTitleColor:color forState:0];
    rightBtn.centerY = leftBtn.centerY;
}
-(void)setLeftBtnTitle:(NSString *)title colcor:(UIColor *)color;
{
    [leftBtn setTitle:title forState:(UIControlStateNormal)];
    [leftBtn sizeToFit];
    leftBtn.height = 44;
    leftBtn.top = 20;
    leftBtn.left =  10;
    [leftBtn setTitleColor:color forState:0];
}

- (void)setNavViewClearColor
{
    navView.backgroundColor =[UIColor clearColor];
    for (UIView *view in navView.subviews) {
        view.backgroundColor =[UIColor clearColor];
    }
}

- (void)doTapLeft{
    if (self.isModel) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)doTapRight
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






-(void)addKeyboardDownTapRecognizerWithView:(UIView *)view
{
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardDown)];
    tapRecognizer.numberOfTapsRequired=1;
    tapRecognizer.cancelsTouchesInView = YES;
    
    if (!view) {
        view = self.view;
    }
    [view addGestureRecognizer:tapRecognizer];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return  [textField resignFirstResponder];
}
- (void)keyboardDown
{
    
    [self.view endEditing: YES];
}

- (void)dealloc {

    NSLog(@"释放了====%@",NSStringFromClass([self class]));
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

