//
//  iKYloadView.m
//  testLodingView
//
//  Created by 郑钦洪 on 15/12/23.
//  Copyright © 2015年 iKingsly. All rights reserved.
//

#import "iKYLoadView.h"
static CGFloat const KLoadingViewWidth = 70;
static CGFloat const KShapeLayerWidth = 40;
static CGFloat const KShapeLayerRadius = KShapeLayerWidth / 2;
static CGFloat const KShapelayerLineWidth = 2.5;
static CGFloat const KAnimationDurationTime = 1.5;
static CGFloat const KShapeLayerMargin = (KLoadingViewWidth - KShapeLayerWidth) / 2;
@implementation iKYLoadView{
    UIVisualEffectView *blurView;
    BOOL isShowing;
}
- (void)awakeFromNib{
    [self setUI];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}

+ (instancetype)shareLoadView{
    static iKYLoadView *loadView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loadView = [[iKYLoadView alloc] init];
    });
    return loadView;
}
- (void)setUI{
    /// 底部的灰色layer
    CAShapeLayer *bottomShapeLayer = [CAShapeLayer layer];
    bottomShapeLayer.strokeColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1].CGColor;
    bottomShapeLayer.fillColor = [UIColor clearColor].CGColor;
    bottomShapeLayer.lineWidth = KShapelayerLineWidth;
//    bottomShapeLayer.lineDashPattern = @[@6,@3];
    bottomShapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(KShapeLayerMargin, 0, KShapeLayerWidth, KShapeLayerWidth) cornerRadius:KShapeLayerRadius].CGPath;
    [self.layer addSublayer:bottomShapeLayer];
    
    /// 橘黄色的layer
    CAShapeLayer *ovalShapeLayer = [CAShapeLayer layer];
    ovalShapeLayer.strokeColor = [UIColor colorWithRed:0.984 green:0.153 blue:0.039 alpha:1.000].CGColor;
    ovalShapeLayer.fillColor = [UIColor clearColor].CGColor;
    ovalShapeLayer.lineWidth = KShapelayerLineWidth;
    ovalShapeLayer.lineDashPattern = @[@6,@3];
    ovalShapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(KShapeLayerMargin, 0,KShapeLayerWidth, KShapeLayerWidth) cornerRadius:KShapeLayerRadius].CGPath;
    [self.layer addSublayer:ovalShapeLayer];
    
    /// 起点动画
    CABasicAnimation * strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeStartAnimation.fromValue = @(-1);
    strokeStartAnimation.toValue = @(1.0);
    
    /// 终点动画
    CABasicAnimation * strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.fromValue = @(0.0);
    strokeEndAnimation.toValue = @(1.0);
    
    /// 组合动画
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[strokeStartAnimation, strokeEndAnimation];
    animationGroup.duration = KAnimationDurationTime;
    animationGroup.repeatCount = CGFLOAT_MAX;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    [ovalShapeLayer addAnimation:animationGroup forKey:nil];
    
    
    UILabel *titleLabel = ({
        UILabel *label = [UILabel new];
        label.text = @"正在加载...";
        label.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0f];
        label.font = [UIFont systemFontOfSize:14];
        label.frame = CGRectMake(0, KShapeLayerWidth + 5, KLoadingViewWidth + 10, 20);
        label.textAlignment = NSTextAlignmentCenter;
        label;
    });
    
    [self addSubview:titleLabel];
}

- (void)showLoadingView{
    if (isShowing) { // 如果没有退出动画，就不能继续添加
        return;
    }
    isShowing = YES;
    /// 拿到主窗口
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    /// view的X
    CGFloat viewCenterX = CGRectGetWidth([UIScreen mainScreen].bounds) / 2;
    /// view的Y
    CGFloat viewCenterY = CGRectGetHeight([UIScreen mainScreen].bounds) / 2;
    
    self.frame = CGRectMake(0, 0, KLoadingViewWidth, KLoadingViewWidth);
    self.center = CGPointMake(viewCenterX, viewCenterY);
 
   /// 添加到主窗口中
    [window addSubview:self];
}

- (void)dismissLoadingView{
    if (isShowing == NO) {
        return;
    }
    isShowing = NO;
    [self removeFromSuperview];
}

- (void)showLoadingViewWithBlur{
    if (isShowing) { // 如果没有退出动画，就不能继续添加
        return;
    }
    isShowing = YES;
    /// 拿到主窗口
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    /// view的X
    CGFloat viewCenterX = CGRectGetWidth([UIScreen mainScreen].bounds) / 2;
    /// view的Y
    CGFloat viewCenterY = CGRectGetHeight([UIScreen mainScreen].bounds) / 2;
    
    self.frame = CGRectMake(0, 0, KLoadingViewWidth, KLoadingViewWidth);
    self.center = CGPointMake(viewCenterX, viewCenterY);
    /// 添加到主窗口中
    [window addSubview:self];
    
    blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
    blurView.layer.cornerRadius = 10;
    blurView.layer.masksToBounds = YES;
    blurView.frame = CGRectMake(0, 0, 100, 100);
    blurView.center = CGPointMake(viewCenterX, viewCenterY);
    /// 添加毛玻璃效果
    [window insertSubview:blurView belowSubview:self];
}

- (void)dismissLoadingViewWithBlur{
    if (isShowing == NO) {
        return;
    }
    isShowing = NO;
    [blurView removeFromSuperview];
    [self removeFromSuperview];
}

@end
