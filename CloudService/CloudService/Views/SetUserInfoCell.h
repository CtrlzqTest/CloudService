//
//  SetUserInfoCell.h
//  CloudService
//
//  Created by zhangqiang on 16/2/24.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SetUserInfoCellDelegate <NSObject>

-(void)textFiledDidChange:(NSString *)text cellIndePath:(NSIndexPath *)indexPath;

@end

@interface SetUserInfoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textFiled;
@property (weak, nonatomic) IBOutlet UIButton *imageBtn;
@property(nonatomic,assign) id<SetUserInfoCellDelegate> delegate;

- (void)isPullDown:(BOOL )pullDown;

@end
