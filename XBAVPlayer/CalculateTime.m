//
//  CalculateTime.m
//  XBAVPlayer
//
//  Created by youxiao on 2019/11/4.
//  Copyright © 2019 youxiao. All rights reserved.
//

#import "CalculateTime.h"

@implementation CalculateTime
+ (instancetype)shareCalTime{
    static CalculateTime *calTime;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        calTime = [[CalculateTime alloc]init];
    });
    return calTime;
}
- (NSString *)changeToHourMinSecWithSeconds:(int)secs{
    NSString *hms = @"";
    int seconds = floor(secs);
    int hour = 0;
    int min = 0;
    int sec = 0;
    if (seconds <= 60){
        sec = seconds;
    }
    else if (seconds < 3600){
        min = seconds/60;
        sec = seconds - min*60;
    }
    else {
        hour = seconds/3600;
        min = (seconds-hour*3600)/60;
        sec = seconds - hour*3600 - min*60;
    }
    hms = [NSString stringWithFormat:@"%@:%@:%@",[self changeTimesToString:hour],[self changeTimesToString:min],[self changeTimesToString:sec]];
    return hms;
}
- (NSString *)changeTimesToString:(int)secs{
    if (secs < 10){
        return [NSString stringWithFormat:@"0%d",secs];
    }
    else {
        return [NSString stringWithFormat:@"%d",secs];
    }
}
@end
