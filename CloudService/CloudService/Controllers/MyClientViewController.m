//
//  MyClientViewController.m
//  CloudService
//
//  Created by 安永超 on 16/2/29.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "MyClientViewController.h"

@interface MyClientViewController ()

@end

@implementation MyClientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    [weakSelf setLeftImageBarButtonItemWithFrame:CGRectMake(0, 0, 20, 20) image:@"title-back" selectImage:@"back" action:^(AYCButton *button) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    __weak typeof(self) weakSelf = self;
    [weakSelf setRightImageBarButtonItemWithFrame:CGRectMake(0, 0, 35, 35) image:@"head-add" selectImage:@"head-add" action:^(AYCButton *button) {
        [weakSelf performSegueWithIdentifier:@"creatClient" sender:weakSelf];
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
