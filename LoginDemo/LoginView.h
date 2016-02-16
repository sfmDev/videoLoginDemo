//
//  LoginView.h
//  LoginDemo
//
//  Created by Get-CC on 16/2/15.
//  Copyright © 2016年 shifengming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageAndTextFieldView.h"

@interface LoginView : UIView

/**
 *  账号
 */
@property (nonatomic,strong)ImageAndTextFieldView *userNameTextView;
/**
 *  密码
 */
@property (nonatomic,strong)ImageAndTextFieldView *passwordTextView;
/**
 *  顶部文字
 */
@property (nonatomic,strong)UILabel *topTitleLable;
/**
 *  login button
 */
@property (nonatomic,strong) UIButton *loginBtn;
/**
 *  regist button
 */
@property (nonatomic,strong) UIButton *registBtn;
/**
 *  确定登录
 */
@property (nonatomic,strong)UIButton *makesureRegistBtn;
@end
