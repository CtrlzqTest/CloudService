//
//  PersonalViewController.m
//  CloudService
//
//  Created by 安永超 on 16/2/23.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "PersonalViewController.h"


@interface PersonalViewController ()

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.title = @"个人中心";
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
