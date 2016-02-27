//
//  ResetPhonePopView.m
//  CloudService
//
//  Created by zhangqiang on 16/2/27.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "ResetPhonePopView.h"

@implementation ResetPhonePopView

-(instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
    self = [[[NSBundle mainBundle] loadNibNamed:@"ResetPhonePopView" owner:self options:nil] firstObject];
    self.frame = [UIScreen mainScreen].bounds;
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.430];
    }
    return self;
}

- (IBAction)cancleAction:(id)sender {
    self.myBlock(0);
    [self removeFromSuperview];
}

- (IBAction)ensureAction:(id)sender {
    self.myBlock(1);
    [self removeFromSuperview];
}

- (IBAction)sendAction:(id)sender {
    self.myBlock(2);
}

- (void)showViewWithCallBack:(ClickBtnBlock )callBack {
    
    self.myBlock = callBack;
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window addSubview:self];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
