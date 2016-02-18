//
//  ViewController.m
//  LoginDemo
//
//  Created by 石峰铭 on 16/2/14.
//  Copyright © 2016年 shifengming. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "LoginView.h"
#import "iKYLoadView.h"

@interface ViewController ()
/**
 *  全屏播放器
 */
@property (strong, nonatomic) AVPlayer *player;
/**
 *  登录 view
 */
@property (strong, nonatomic) LoginView *loginView;

@end

@implementation ViewController
#pragma mark =======================life cycle
- (void)viewWillAppear:(BOOL)animated
{
    //视频播放
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playVideos) name:@"videoshouldplay" object:nil];
}

- (void)playVideos
{
    [self.player play];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupForAVplayerView];
    
    //毛玻璃
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.5f];
    [visualEffectView setAlpha:0.4f];
    [UIView commitAnimations];
    [visualEffectView setFrame:self.view.bounds];
    [self.view addSubview:visualEffectView];
    
    _loginView = [[LoginView alloc]initWithFrame:self.view.bounds];
    _loginView.alpha = 0.f;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.5f];
    _loginView.alpha = 1.0f;
    [UIView commitAnimations];
    [self.view addSubview:_loginView];
    
    //注册
    [_loginView.registBtn addTarget:self action:@selector(registUser) forControlEvents:UIControlEventTouchUpInside];
    //登录
    [_loginView.loginBtn addTarget:self action:@selector(loginUser) forControlEvents:UIControlEventTouchUpInside];
    
    [self setTextFieldTransform];
}

/**
 *  设置登陆框 transform
 */
- (void)setTextFieldTransform
{
    _loginView.userNameTextView.transform = CGAffineTransformMakeTranslation(400, 0);
    _loginView.passwordTextView.transform = CGAffineTransformMakeTranslation(400, 0);
    _loginView.makesureRegistBtn.transform = CGAffineTransformMakeTranslation(400, 0);
}

/**
 *  注册 登录两个消失
 */
- (void)dismissFirstLoginView
{
    //原来页面的消失
    [UIView beginAnimations:nil context:nil];
    //    _loginView.transform = CGAffineTransformMakeTranslation(0, -100);
    [UIView setAnimationDuration:1.0f];
    _loginView.registBtn.alpha = 0.001f;
    _loginView.loginBtn.alpha = 0.001f;
    [UIView commitAnimations];
}

/**
 *  注册按钮方法
 */
- (void)registUser
{
    [self dismissFirstLoginView];
}

- (void)goToRegistUser
{
    [self.view endEditing:YES];
    [[iKYLoadView shareLoadView]showLoadingViewWithBlur];
    [self performSelector:@selector(removeLoadingView) withObject:self afterDelay:1.5f];
}

- (void)removeLoadingView
{
    [[iKYLoadView shareLoadView]dismissLoadingViewWithBlur];
//    NSLog(@"%@",_loginView.userNameTextView.inputTextField.text);
//    NSLog(@"%@",_loginView.passwordTextView.inputTextField.text);
    NSString *str = [NSString stringWithFormat:@"%@ %@",_loginView.userNameTextView.inputTextField.text,_loginView.passwordTextView.inputTextField.text];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
    [UIView animateWithDuration:1.5f animations:^{
        [self setTextFieldTransform];
    }];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0f];
    _loginView.registBtn.alpha = 1;
    _loginView.loginBtn.alpha = 1;
    [UIView commitAnimations];
}

/**
 *  登录按钮方法
 */
- (void)loginUser
{
    [self dismissFirstLoginView];
    
    //注册出现
    [UIView animateWithDuration:1.0 animations:^{
        _loginView.userNameTextView.transform = CGAffineTransformIdentity;
        _loginView.passwordTextView.transform = CGAffineTransformIdentity;
        _loginView.makesureRegistBtn.transform = CGAffineTransformIdentity;
    }];
    
    /**
     *  提交注册信息
     */
    [_loginView.makesureRegistBtn addTarget:self action:@selector(goToRegistUser) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupForAVplayerView
{
    //创建播放图层
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:playerLayer];
}

/**
 *  初始化播放器
 */
- (AVPlayer *)player
{
    if (!_player) {
        AVPlayerItem *playerItem = [self getPlayItem];
        _player = [AVPlayer playerWithPlayerItem:playerItem];
        //设置重复播放
        _player.actionAtItemEnd = AVPlayerActionAtItemEndNone; // set this
        
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(__playerItemDidPlayToEndTimeNotification:)
                                                    name:AVPlayerItemDidPlayToEndTimeNotification
                                                object:nil];
        
    }
    return _player;
}

- (void)__playerItemDidPlayToEndTimeNotification:(NSNotification *)sender
{
    [_player seekToTime:kCMTimeZero]; // seek to zero
}

- (AVPlayerItem *)getPlayItem
{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"BridgeLoop-640p" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
    return playerItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
