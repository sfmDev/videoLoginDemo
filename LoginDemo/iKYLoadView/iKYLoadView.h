//
//  iKYloadView.h
//  testLodingView
//
//  Created by 郑钦洪 on 15/12/23.
//  Copyright © 2015年 iKingsly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iKYLoadView : UIView
/**
 *  显示加载动画
 */
- (void)showLoadingView;
/**
 *  关闭加载动画
 */
- (void)dismissLoadingView;
/**
 *  创建动画单例
 *
 *  @return iKYloadView
 */
+ (instancetype)shareLoadView;

/**
 *  显示加载动画(带毛玻璃效果)
 */
- (void)showLoadingViewWithBlur;

/**
 *  关闭加载动画(带毛玻璃效果)
 */
- (void)dismissLoadingViewWithBlur;
@end
