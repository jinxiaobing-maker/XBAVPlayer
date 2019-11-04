//
//  XBVideoPlayer.m
//  XBAVPlayer
//
//  Created by youxiao on 2019/10/31.
//  Copyright © 2019 youxiao. All rights reserved.
//

#import "XBVideoPlayer.h"
#import <AVKit/AVKit.h>
#import "XBVideoProgressView.h"
#import "CalculateTime.h"
@interface XBVideoPlayer()
@property(nonatomic,strong,readwrite)AVPlayerItem *videoItem;
@property(nonatomic,strong,readwrite)AVPlayer *player;
@property(nonatomic,strong,readwrite)AVPlayerLayer *playerLayer;
@property(nonatomic,strong,readwrite)UIView *targetView;
@property(nonatomic,strong,readwrite)XBVideoProgressView *progressView;
@property(nonatomic,assign,readwrite)int duration; // 视频总时长
@end

@implementation XBVideoPlayer

+ (instancetype)sharePlayer{
    static XBVideoPlayer *player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[XBVideoPlayer alloc]init];
    });
    return player;
}
- (void)showWithUrlStrAndSuperView:(NSString *)url superView:(UIView *)targetView{
    [self initPlayItem:url];
    [self initAvPlayer];
    _playerLayer = [[AVPlayerLayer alloc]init]; // 视频展示层 V
    _playerLayer.player = _player;
    _playerLayer.frame = CGRectMake(0, 0, targetView.bounds.size.width, targetView.bounds.size.height);
    [targetView.layer addSublayer:_playerLayer];
    __weak typeof(self) weakSelf = self;
    // 获取播放进度
    [_player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        [weakSelf changeProgressTimeWithPlayed:CMTimeGetSeconds(time)];
    }];
    // 接收播放完成通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    // 添加进度部分
    [self initProgressView];
    [targetView addSubview:_progressView];
}
- (void)initProgressView{
    CGFloat w = _playerLayer.frame.size.width;
    CGFloat h = _playerLayer.frame.size.height;
    _progressView = [[XBVideoProgressView alloc]initWithFrame:CGRectMake(0, h-50, w, 40)];
    [_targetView addSubview:_progressView];
    __weak typeof(self) weakSelf = self;
    _progressView.progressChanged = ^(float progress) {
        [weakSelf.player seekToTime:CMTimeMake(progress*self.duration, 1)];
    };
}
- (void)initPlayItem:(NSString *)urlStr{
    NSURL *videoUrl = [NSURL URLWithString:urlStr];
    AVAsset *asset = [AVAsset assetWithURL:videoUrl];
    _videoItem = [AVPlayerItem playerItemWithAsset:asset]; // 视频资源信息 M
    [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:@"item.status"];
    [_videoItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:@"item.loaded"];
}
- (void)initAvPlayer{
    _player = [AVPlayer playerWithPlayerItem:_videoItem]; // 视频控制播放层 C
}
- (void)stopPlay{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_videoItem removeObserver:self forKeyPath:@"status"];
    [_videoItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    [_playerLayer removeFromSuperlayer];
}
- (void)handlePlayEnd{
    [_player seekToTime:CMTimeMake(0, 1)];
    [_player play];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"status"] && context == @"item.status"){// 可播放状态
        if (((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay){
            [_player play];
            // 视频总时长
            self.duration = CMTimeGetSeconds(_videoItem.duration);
            [self changeProgressTimeWithPlayed:0];
        }
    }
    else if ([keyPath isEqualToString:@"loadedTimeRanges"] && context == @"item.loaded"){
        // 缓冲进度
//        CMTimeRange rangeValue = [[change objectForKey:NSKeyValueChangeNewKey][0] CMTimeRangeValue];
//        NSLog(@"---rangeValue---%f-------%f",CMTimeGetSeconds(rangeValue.start),CMTimeGetSeconds(rangeValue.duration));
    }
}
- (void)changeProgressTimeWithPlayed:(int)playedTime{
    [self.progressView changeProgressWithPlayedTimeAndDuration:playedTime all:self.duration];
}
@end
