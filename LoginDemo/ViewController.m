//
//  ViewController.m
//  LoginDemo
//
//  Created by 石峰铭 on 16/2/14.
//  Copyright © 2016年 shifengming. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (strong, nonatomic) AVPlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupForAVplayerView];
    
    //遮罩
    UIView *maskView = [[UIView alloc]initWithFrame:self.view.bounds];
    maskView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:maskView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.5f];
    maskView.alpha = 0.3f;
    [UIView commitAnimations];
    
    //视频播放
    [self.player play];
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
