//
//  XBVideoPlayer.h
//  XBAVPlayer
//
//  Created by youxiao on 2019/10/31.
//  Copyright © 2019 youxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface XBVideoPlayer : NSObject

+ (instancetype)sharePlayer;
- (void)showWithUrlStrAndSuperView:(NSString *)url superView:(UIView *)targetView;

@end

NS_ASSUME_NONNULL_END
