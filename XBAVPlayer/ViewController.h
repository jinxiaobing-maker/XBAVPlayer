//
//  ViewController.h
//  XBAVPlayer
//
//  Created by youxiao on 2019/10/31.
//  Copyright © 2019 youxiao. All rights reserved.
//
typedef void(^testBlock)(void);
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic, copy)testBlock block;
@end

