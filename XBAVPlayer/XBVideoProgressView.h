//
//  VideoProgressView.h
//  XBAVPlayer
//
//  Created by youxiao on 2019/11/4.
//  Copyright © 2019 youxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^changeProgress)(float);
@interface XBVideoProgressView : UIView

@property(nonatomic,copy)changeProgress progressChanged;

- (void)changeProgressWithPlayedTimeAndDuration:(int)played all:(int)duration;

@end

NS_ASSUME_NONNULL_END
