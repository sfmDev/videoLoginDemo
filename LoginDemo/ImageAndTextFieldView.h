//
//  ImageAndTextFieldView.h
//  LoginDemo
//
//  Created by Get-CC on 16/2/16.
//  Copyright © 2016年 shifengming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageAndTextFieldView : UIView

/**
 *  输入框
 */
@property (nonatomic,strong)UITextField *inputTextField;
/**
 *  placeholderText
 */
@property (nonatomic,strong)NSString *placeholdString;
/**
 *  图片
 */
@property (nonatomic,strong)UIImage *image;

@end
