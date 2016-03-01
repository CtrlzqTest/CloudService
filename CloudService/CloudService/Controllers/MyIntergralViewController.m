//
//  MyIntergralViewController.m
//  CloudService
//
//  Created by zhangqiang on 16/3/1.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "MyIntergralViewController.h"

@interface MyIntergralViewController ()
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *intergTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *intergUseLabel;
@property (weak, nonatomic) IBOutlet UILabel *intergUnuseLabel;
@end

@implementation MyIntergralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    
    self.title = @"我的积分";
    __weak typeof(self) weakSelf = self;
    [self setLeftImageBarButtonItemWithFrame:CGRectMake(0, 0, 35, 35) image:@"title-back" selectImage:@"" action:^(AYCButton *button) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    self.backView.layer.cornerRadius = KWidth * 3 / 7 / 2.0;
    
}

- (void)viewWillAppear:(BOOL)animated {
    __weak typeof(self) weakSelf = self;
    [weakSelf setRightTextBarButtonItemWithFrame:CGRectMake(0, 0, 80, 30) title:@"积分明细" titleColor:[UIColor whiteColor] backImage:@"" selectBackImage:@"" action:^(AYCButton *button) {
        [weakSelf performSegueWithIdentifier:@"integral" sender:weakSelf];
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
