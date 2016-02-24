//
//  LoginInputView.m
//  CloudService
//
//  Created by zhangqiang on 16/2/24.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "LoginInputView.h"

@implementation LoginInputView


- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ref, 0.2);
    CGContextMoveToPoint(ref, 0, rect.size.height / 2.0);
    CGContextAddLineToPoint(ref, rect.size.width, rect.size.height / 2.0);
    CGContextSetStrokeColorWithColor(ref, [UIColor whiteColor].CGColor);
    CGContextStrokePath(ref);
}


@end
