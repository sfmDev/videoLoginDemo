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

- (void)setLoginUI
{
    _topTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kWindowWidth, kLabelHeight)];
    _topTitleLable.center = CGPointMake(kWindowWidth/2, kWindowHeigth/4);
    _topTitleLable.text = @"Hey,iOSer";
    _topTitleLable.font = [UIFont fontWithName:@"Helvetica-Oblique" size:28];
    _topTitleLable.textAlignment = NSTextAlignmentCenter;
    _topTitleLable.textColor = [UIColor blackColor];
    [self addSubview:_topTitleLable];
    
    CGFloat btnWidth = (kWindowWidth-4*x_OffSet)/2;
    _registBtn = [[UIButton alloc]initWithFrame:CGRectMake(x_OffSet*2, kWindowHeigth-100, btnWidth-x_OffSet/2, 44)];
    [_registBtn setTitle:@"注册" forState:0];
    _registBtn.layer.cornerRadius = 5.0f;
    [_registBtn setTitleColor:[UIColor darkGrayColor] forState:0];
    [_registBtn setBackgroundColor:[[UIColor whiteColor]colorWithAlphaComponent:0.8f]];
    [self addSubview:_registBtn];
    
    _loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_registBtn.frame)+x_OffSet,kWindowHeigth-100, btnWidth-x_OffSet/2, 44)];
    [_loginBtn setTitle:@"登录" forState:0];
    _loginBtn.layer.cornerRadius = 5.0f;
    [_loginBtn setTitleColor:[UIColor darkGrayColor] forState:0];
    [_loginBtn setBackgroundColor:[[UIColor whiteColor]colorWithAlphaComponent:0.8f]];
    [self addSubview:_loginBtn];
    
    _userNameTextView = [[ImageAndTextFieldView alloc]initWithFrame:CGRectMake(x_OffSet, kWindowWidth*2/3, kWindowWidth-x_OffSet*2, 47)];
    _userNameTextView.placeholdString = @"请输入手机号或者邮箱";
    _userNameTextView.image = [UIImage imageNamed:@"icon_phone_select@2x"];
    [self addSubview:_userNameTextView];
    
    _passwordTextView = [[ImageAndTextFieldView alloc]initWithFrame:CGRectMake(x_OffSet, CGRectGetMaxY(_userNameTextView.frame)+5, kWindowWidth-x_OffSet*2, 47)];
    _passwordTextView.placeholdString = @"请输入密码";
    _passwordTextView.inputTextField.secureTextEntry = YES;
    _passwordTextView.image = [UIImage imageNamed:@"icon_code_select@2x"];
    [self addSubview:_passwordTextView];
    
    _makesureRegistBtn = [[UIButton alloc]initWithFrame:CGRectMake(x_OffSet, CGRectGetMaxY(_passwordTextView.frame)+x_OffSet, kWindowWidth-x_OffSet*2, 44)];
    [_makesureRegistBtn setTitle:@"注册" forState:0];
    [_makesureRegistBtn setTitleColor:[UIColor whiteColor] forState:0];
    [_makesureRegistBtn setBackgroundColor:[UIColor colorWithRed:0 green:0.71 blue:0.54 alpha:1]];
    _makesureRegistBtn.layer.cornerRadius = 5.0f;
    _makesureRegistBtn.layer.borderWidth = 1.0f;
    _makesureRegistBtn.layer.borderColor = [UIColor clearColor].CGColor;
    [self addSubview:_makesureRegistBtn];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
