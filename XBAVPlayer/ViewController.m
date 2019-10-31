//
//  ViewController.m
//  XBAVPlayer
//
//  Created by youxiao on 2019/10/31.
//  Copyright © 2019 youxiao. All rights reserved.
//

#import "ViewController.h"
#import "XBVideoPlayer.h"

#define W [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initPlayer];
}
- (void)initPlayer{
    NSString *testUrl = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
    UIView *itemView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, W, 200)];
    itemView.backgroundColor = [UIColor redColor];
    [self.view addSubview:itemView];
    [[XBVideoPlayer sharePlayer] showWithUrlStrAndSuperView:testUrl superView:itemView];
}

@end
