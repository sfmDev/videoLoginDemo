//
//  LoginView.m
//  LoginDemo
//
//  Created by Get-CC on 16/2/15.
//  Copyright © 2016年 shifengming. All rights reserved.
//

#import "LoginView.h"

#define kWindowWidth [UIScreen mainScreen].bounds.size.width
#define kWindowHeigth [UIScreen mainScreen].bounds.size.height
#define kLabelHeight 50
#define x_OffSet 20

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setLoginUI];
    }
    return self;
}

/**
 *  顶部文字
 */
//@property (nonatomic,strong)UILabel *topTitleLable;
///**
// *  账号
// */
//@property (nonatomic,strong)UITextField *userNameTextField;
///**
// *  密码
// */
//@property (nonatomic,strong)UITextField *passwordTextField;
///**
// *  button
// */
//@property (nonatomic,strong) UIButton *loginBtn;

- (void)setLoginUI
{
    _topTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kWindowWidth, kLabelHeight)];
    _topTitleLable.center = CGPointMake(kWindowWidth/2, kWindowHeigth/4);
    _topTitleLable.text = @"Hey,iOSer";
    _topTitleLable.font = [UIFont systemFontOfSize:28];
    _topTitleLable.textAlignment = NSTextAlignmentCenter;
    _topTitleLable.textColor = [UIColor blackColor];
    [self addSubview:_topTitleLable];
    
    CGFloat btnWidth = (kWindowWidth-4*x_OffSet)/2;
    UIButton *registBtn = [[UIButton alloc]initWithFrame:CGRectMake(x_OffSet*2, kWindowHeigth-100, btnWidth-x_OffSet/2, 44)];
    NSLog(@"%@",NSStringFromCGRect(registBtn.frame));
    [registBtn setTitle:@"注册" forState:0];
    registBtn.layer.cornerRadius = 5.0f;
    [registBtn setTitleColor:[UIColor darkGrayColor] forState:0];
    [registBtn setBackgroundColor:[[UIColor whiteColor]colorWithAlphaComponent:0.8f]];
    [self addSubview:registBtn];
    
    UIButton *loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(registBtn.frame)+x_OffSet,kWindowHeigth-100, btnWidth-x_OffSet/2, 44)];
    NSLog(@"%@",NSStringFromCGRect(loginBtn.frame));
    [loginBtn setTitle:@"登录" forState:0];
    loginBtn.layer.cornerRadius = 5.0f;
    [loginBtn setTitleColor:[UIColor darkGrayColor] forState:0];
    [loginBtn setBackgroundColor:[[UIColor whiteColor]colorWithAlphaComponent:0.8f]];
    [self addSubview:loginBtn];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
