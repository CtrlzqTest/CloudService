//
//  SetNewPwdViewController.m
//  CloudService
//
//  Created by zhangqiang on 15/1/1.
//  Copyright © 2015年 zhangqiang. All rights reserved.
//

#import "SetNewPwdViewController.h"

@interface SetNewPwdViewController ()

@property (weak, nonatomic) IBOutlet UITextField *pwdTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *enSurePwdTextFiled;

@end

@implementation SetNewPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置新密码";
}

- (IBAction)resetPwdAction:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.tabBarController.navigationController setNavigationBarHidden:YES animated:YES];
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
