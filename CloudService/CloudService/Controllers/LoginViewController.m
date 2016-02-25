//
//  LoginViewController.m
//  CloudService
//
//  Created by zhangqiang on 16/2/23.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "LoginViewController.h"
#import "RestAPI.h"
#import <Masonry.h>
#import "LoginInputView.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet LoginInputView *inputView;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *UserTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextFiled;
@property (weak, nonatomic) IBOutlet UIImageView *backImg;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBarTintColor:[HelperUtil colorWithHexString:@"277FD9"]];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)setupView {
    
    self.inputView.layer.cornerRadius = 3;
    self.inputView.clipsToBounds = YES;
//    self.inputView.layer.borderWidth = 0.1;
//    self.inputView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.inputView.backgroundColor = [UIColor colorWithRed:0.918 green:0.917
                                                      blue:0.925 alpha:0.500];
    
    UIColor *color = [UIColor colorWithRed:0.263 green:0.561 blue:0.796 alpha:1.000];
    self.UserTextFiled.attributedPlaceholder = [[NSAttributedString alloc]
                                                initWithString:@"用户名/手机号码/邮箱"
                                                attributes:@{NSForegroundColorAttributeName:color}];
    
    self.pwdTextFiled.attributedPlaceholder = [[NSAttributedString alloc]
                                               initWithString:@"请输入密码"
                                               attributes:@{NSForegroundColorAttributeName:color}];
//    [self.inputView setNeedsDisplay];
    
    self.loginBtn.layer.cornerRadius = 3;
    self.loginBtn.clipsToBounds = YES;
    [self.view sendSubviewToBack:self.backImg];
    
}

// 登录
- (IBAction)loginAction:(id)sender {
    
    [self performSegueWithIdentifier:@"login" sender:self];
    
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
