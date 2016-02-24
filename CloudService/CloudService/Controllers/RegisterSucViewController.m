//
//  RegisterSucViewController.m
//  CloudService
//
//  Created by zhangqiang on 16/2/23.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "RegisterSucViewController.h"

@interface RegisterSucViewController ()

@property (weak, nonatomic) IBOutlet UIButton *inputBtn;
@property (weak, nonatomic) IBOutlet UIButton *pushMenuBtn;


@end

@implementation RegisterSucViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)gotoMenuAction:(id)sender {
    
    [self performSegueWithIdentifier:RegisterToMenuView sender:self];
    
}

-(void)dealloc{
    NSLog(@"注册suc页面已销毁");
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
