//
//  XBVideoPlayer.m
//  XBAVPlayer
//
//  Created by youxiao on 2019/10/31.
//  Copyright © 2019 youxiao. All rights reserved.
//

#import "XBVideoPlayer.h"
#import <AVKit/AVKit.h>

@interface XBVideoPlayer()

@property(nonatomic,strong,readwrite)AVPlayerItem *videoItem;
@property(nonatomic,strong,readwrite)AVPlayer *player;
@property(nonatomic,strong,readwrite)AVPlayerLayer *playerLayer;
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
    NSURL *videoUrl = [NSURL URLWithString:url];
    AVAsset *asset = [AVAsset assetWithURL:videoUrl];
    _videoItem = [AVPlayerItem playerItemWithAsset:asset]; // 视频资源信息 M
    _player = [AVPlayer playerWithPlayerItem:_videoItem]; // 视频控制播放层 C
    _playerLayer = [[AVPlayerLayer alloc]init]; // 视频展示层 V
    _playerLayer.player = _player;
    _playerLayer.frame = CGRectMake(0, 0, targetView.bounds.size.width, targetView.bounds.size.height);
    [targetView.layer addSublayer:_playerLayer];
    
    [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:@"item.status"];
    [_videoItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:@"item.loaded"];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"status"] && context == @"item.status"){// 可播放状态
        if (((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay){
            [_player play];
            NSLog(@"----CMTimeGetSeconds----%f",CMTimeGetSeconds(_videoItem.duration));
        }
    }
    else if ([keyPath isEqualToString:@"loadedTimeRanges"] && context == @"item.loaded"){
//        NSLog(@"---change---%@",[[change objectForKey:NSKeyValueChangeNewKey][0] CMTimeRangeValue]);
    }
}
@end
