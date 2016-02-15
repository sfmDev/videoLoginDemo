//
//  LoginView.h
//  LoginDemo
//
//  Created by Get-CC on 16/2/15.
//  Copyright © 2016年 shifengming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView
/**
 *  顶部文字
 */
@property (nonatomic,strong)UILabel *topTitleLable;
/**
 *  账号
 */
@property (nonatomic,strong)UITextField *userNameTextField;
/**
 *  密码
 */
@property (nonatomic,strong)UITextField *passwordTextField;
/**
 *  login button
 */
@property (nonatomic,strong) UIButton *loginBtn;
/**
 *  regist button
 */
@property (nonatomic,strong) UIButton *registBtn;
@end
