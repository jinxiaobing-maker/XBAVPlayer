//
//  VideoProgressView.m
//  XBAVPlayer
//
//  Created by youxiao on 2019/11/4.
//  Copyright © 2019 youxiao. All rights reserved.
//

#import "XBVideoProgressView.h"
#import "CalculateTime.h"
#import "XBSlider.h"

@interface XBVideoProgressView()
<UIGestureRecognizerDelegate>
@property(nonatomic,strong,readwrite)UILabel *palyedTimeLab;
@property(nonatomic,strong,readwrite)UILabel *durationLab;
@property(nonatomic,strong,readwrite)XBSlider *xbSlider;
@end

@implementation XBVideoProgressView

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
    _xbSlider = [[XBSlider alloc]initWithFrame:CGRectMake(60, 10, SELFW-120, 20)];
    [_xbSlider setMinimumValue:0];
    [_xbSlider setMaximumValue:1];
    _xbSlider.maximumTrackTintColor = [UIColor blackColor];
    _xbSlider.tintColor = [UIColor whiteColor];
    [_xbSlider setThumbImage:[UIImage imageNamed:@"progressCircle"] forState:UIControlStateNormal];
    [_xbSlider addTarget:self action:@selector(sliderChange:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_xbSlider];
}
- (void)sliderChange:(XBSlider *)slider{
    if (self.progressChanged){
        self.progressChanged(slider.value);
    }
}
- (void)initDurationLa{
    self.durationLab = [[UILabel alloc]initWithFrame:CGRectMake(SELFW-55, 0, 55, SELFH)];
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
    float progress = (played*0.1*10.0)/(duration*0.1*10.0);
    [_xbSlider setValue:progress animated:YES];
}
@end
