//
//  SetUserInfoCell.m
//  CloudService
//
//  Created by zhangqiang on 16/2/24.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "SetUserInfoCell.h"

@implementation SetUserInfoCell

- (void)awakeFromNib {
    self.contentView.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)isPullDown:(BOOL )pullDown {
    
    self.textFiled.enabled = NO;
    [self.imageBtn setImage:[UIImage imageNamed:@"title-back"] forState:UIControlStateNormal];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
