//
//  CalculateTime.h
//  XBAVPlayer
//
//  Created by youxiao on 2019/11/4.
//  Copyright © 2019 youxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculateTime : NSObject

+ (instancetype)shareCalTime;
- (NSString *)changeToHourMinSecWithSeconds:(int)secs;
@end

NS_ASSUME_NONNULL_END
