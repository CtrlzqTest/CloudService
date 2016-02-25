//
//  RegisterSucViewController.m
//  CloudService
//
//  Created by zhangqiang on 16/2/23.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "RegisterSucViewController.h"

@interface RegisterSucViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *inputBtn;
@property (weak, nonatomic) IBOutlet UIButton *pushMenuBtn;
@property (weak, nonatomic) IBOutlet UIImageView *iconHeadImg;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contenSize_H;

@end

@implementation RegisterSucViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 400, 320, 200)];
//    scrollView.backgroundColor = [UIColor redColor];
//    UIButton *butn = [UIButton buttonWithType:(UIButtonTypeSystem)];
//    butn.frame = CGRectMake(50, 50, 50, 50);
//    [butn setTitle:@"nima" forState:(UIControlStateNormal)];
//    [butn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [scrollView addSubview:butn];
//    [self.view addSubview:scrollView];
//    
//    [butn addTarget:self action:@selector(ddd) forControlEvents:UIControlEventTouchUpInside];
//    self.scrollView.contentSize = CGSizeMake(KWidth, KHeight);
}



- (void)setupViews {
    
    self.inputBtn.layer.cornerRadius = 3;
    self.inputBtn.layer.borderWidth = 0.6;
    self.inputBtn.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.pushMenuBtn.layer.cornerRadius = 3;
    self.pushMenuBtn.layer.borderWidth = 0.6;
    self.pushMenuBtn.layer.borderColor = [UIColor grayColor].CGColor;
    
}



- (IBAction)gotoMenuAction:(id)sender {
    
    
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
