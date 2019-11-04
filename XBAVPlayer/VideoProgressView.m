//
//  VideoProgressView.m
//  XBAVPlayer
//
//  Created by youxiao on 2019/11/4.
//  Copyright © 2019 youxiao. All rights reserved.
//

#import "VideoProgressView.h"

@implementation VideoProgressView

#define SELFW self.frame.size.width
#define SELFH self.frame.size.height
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
        [self initProgressView];
    }
    return self;
}
- (void)initProgressView{
    UIView *progressView = [[UIView alloc]initWithFrame:CGRectMake(0, (SELFH-5)/2.0, SELFW, 5)];
    progressView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:progressView];
}
@end
