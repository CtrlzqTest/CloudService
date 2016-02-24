//
//  HomeViewController.m
//  CloudService
//
//  Created by 安永超 on 16/2/23.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationBarTitleColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
//    [self.tabBarController setImageTitleViewWithFrame:CGRectMake(0, 30, 0, 50) image:@"reg_head"];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.title = @"首页";
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
