//
//  ViewController.m
//  XBAVPlayer
//
//  Created by youxiao on 2019/10/31.
//  Copyright ©  All rights reserved.
//

#import "ViewController.h"
#import "XBVideoPlayer.h"
#import <objc/message.h>


#define W [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initPlayer];
    
    Class class = NSClassFromString(@"People");
    NSObject *object = [[class alloc] init];
    objc_msgSend(object, NSSelectorFromString(@"handlePeopleMsg:age:"),@"这是名字小冰",100);
    
    
}
- (void)addTestBtn{
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(100, 100, 100, 100);
    [loginBtn setTitle:@"注册吧老兄" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
}
- (void)registerBtnClick:(UIButton *)sender{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:btn];
}
- (void)initPlayer{
    NSString *testUrl = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
    UIView *itemView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, W, 220)];
    [self.view addSubview:itemView];
    [[XBVideoPlayer sharePlayer] showWithUrlStrAndSuperView:testUrl superView:itemView];
}

@end
