//
//  SetUserInfoCell.m
//  CloudService
//
//  Created by zhangqiang on 16/2/24.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "SetUserInfoCell.h"

@interface SetUserInfoCell()<UITextFieldDelegate>


@end
@implementation SetUserInfoCell

- (void)awakeFromNib {
    self.contentView.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.textFiled.delegate = self;
}

- (void)isPullDown:(BOOL )pullDown {
    if (pullDown) {
        self.textFiled.enabled = NO;
        self.imageBtn.hidden = NO;
        [self.imageBtn setImage:[UIImage imageNamed:@"title-back"] forState:UIControlStateNormal];
    }else {
        self.textFiled.enabled = YES;
        self.imageBtn.hidden = YES;
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSLog(@"%@",string);
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
