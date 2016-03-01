//
//  HomeHeaderView.m
//  CloudService
//
//  Created by zhangqiang on 15/1/2.
//  Copyright © 2015年 zhangqiang. All rights reserved.
//

#import "HomeHeaderView.h"
#import "ZQScrollPageView.h"

@implementation HomeHeaderView {
    ZQScrollPageView *_scrollPageView;
}

- (void)awakeFromNib {
    // Initialization code
    _scrollPageView = [[ZQScrollPageView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 240 * KHeight / 667.0 - 75)];
    [self.pageScrBackView addSubview:_scrollPageView];
}

- (void)playWithImageArray:(NSArray *)imgStrArray clickAtIndex:(ClickBlock )tapIndex {
    
    [_scrollPageView playWithImageArray:imgStrArray TimeInterval:5 imageType:ImageTypeBundle clickImage:tapIndex];
}

@end
