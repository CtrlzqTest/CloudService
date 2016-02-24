//
//  RegisterViewController.m
//  CloudService
//
//  Created by zhangqiang on 16/2/23.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "RegisterViewController.h"
#import "RestAPI.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

// 注册
- (IBAction)registerAction:(id)sender {
    
    [self performSegueWithIdentifier:RegisterSuccess sender:self];
    
}

// 定位按钮
- (IBAction)locateAction:(id)sender {
    
    
}

-(void)dealloc{
    NSLog(@"注册页面已销毁");
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
