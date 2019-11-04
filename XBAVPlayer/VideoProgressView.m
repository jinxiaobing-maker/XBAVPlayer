//
//  VideoProgressView.m
//  XBAVPlayer
//
//  Created by youxiao on 2019/11/4.
//  Copyright © 2019 youxiao. All rights reserved.
//

#import "VideoProgressView.h"
#import "CalculateTime.h"

@interface VideoProgressView()
@property(nonatomic,strong,readwrite)UILabel *palyedTimeLab;
@property(nonatomic,strong,readwrite)UILabel *durationLab;
@property(nonatomic,strong,readwrite)UIView *progressView;
@end

@implementation VideoProgressView

#define SELFW self.frame.size.width
#define SELFH self.frame.size.height
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
        [self initProgressView];
        [self initDurationLa];
        [self initTimeLab];
    }
    return self;
}
- (void)initProgressView{
    _progressView = [[UIView alloc]initWithFrame:CGRectMake(60, (SELFH-5)/2.0, SELFW-120, 5)];
    _progressView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    _progressView.clipsToBounds = YES;
    _progressView.layer.cornerRadius = 2;
    [self addSubview:_progressView];
}
- (void)initDurationLa{
    self.durationLab = [[UILabel alloc]initWithFrame:CGRectMake(SELFW-58, 0, 55, SELFH)];
    self.durationLab.text = @"00:00:00";
    self.durationLab.font = [UIFont systemFontOfSize:12];
    self.durationLab.textColor = [UIColor whiteColor];
    [self addSubview:self.durationLab];
}
- (void)initTimeLab{
    self.palyedTimeLab = [[UILabel alloc]initWithFrame:CGRectMake(2, 0, 55, SELFH)];
    self.palyedTimeLab.text = @"00:00:00";
    self.palyedTimeLab.font = [UIFont systemFontOfSize:12];
    self.palyedTimeLab.textColor = [UIColor whiteColor];
    [self addSubview:self.palyedTimeLab];
}
- (void)changeProgressWithPlayedTimeAndDuration:(int)played all:(int)duration{
    self.durationLab.text = [[CalculateTime shareCalTime] changeToHourMinSecWithSeconds:duration-played];
    self.palyedTimeLab.text = [[CalculateTime shareCalTime] changeToHourMinSecWithSeconds:played];
}
@end
