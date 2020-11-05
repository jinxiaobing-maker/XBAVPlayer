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
#import "Test.h"
#import "UIColor+Utils.h"


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
    

    UITextField *textField = [[UITextField alloc]init];
    textField.text = @"asdsadasd";
    [self.view addSubview:textField];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn2];

    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn3.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn3];
     
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn4.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn4];
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn5.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn5];
    
    UIButton *btn7 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn7.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn7];
    
    UIButton *btn8 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn8.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn8];
    
    UIButton *btn9 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn9.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn9];

    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn6.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn6];

    UIButton *btn10 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn10.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn10];
    
    UIButton *btn11 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn11.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn11];
    
    UIButton *btn12 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn12.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn12];
    
    UIButton *btn13 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn13.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn13];
    
    UIButton *btn14 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn14.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn14];
    
    UIButton *btn15 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn15.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn15];
    
    UIButton *btn16 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn16.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn16];
    
    UIButton *btn17 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn17.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn17];
    
    Test *t = [[Test alloc]init];
    NSMutableArray *tempArr = [[NSMutableArray alloc]initWithCapacity:0];
    t.tempArr = tempArr;
    NSLog(@"---1111---%p",t.tempArr);
    NSLog(@"---2222---%p",tempArr);
    
    UIView *testView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    NSString *hex = @"#F0F0F4";
    testView.backgroundColor = [UIColor colorWithHexString:hex alpha:1];
    [self.view addSubview:testView];
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
