//
//  PersonalViewCell.m
//  CloudService
//
//  Created by zhangqiang on 16/2/26.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "PersonalViewCell.h"

@implementation PersonalViewCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
