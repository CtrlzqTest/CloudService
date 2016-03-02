//
//  InviteFriendViewController.m
//  CloudService
//
//  Created by zhangqiang on 15/1/2.
//  Copyright © 2015年 zhangqiang. All rights reserved.
//

#import "InviteFriendViewController.h"
#import "LBXScanWrapper.h"

@interface InviteFriendViewController ()
@property (weak, nonatomic)IBOutlet UIImageView *qrImgView;
@end

@implementation InviteFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"邀请队员";
    [self createQR1];
    __weak typeof(self) weakSelf = self;
    [self setLeftImageBarButtonItemWithFrame:CGRectMake(0, 0, 35, 35) image:@"title-back" selectImage:@"" action:^(AYCButton *button) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    
}
- (void)createQR1
{
    //可以把你要使用的信息加进去生成二维码
    UIImage *qrImg = [LBXScanWrapper createQRWithString:@"www.baidu.com" size:_qrImgView.bounds.size];
    UIImage *newImage= [LBXScanWrapper addImageLogo:qrImg centerLogoImage:[UIImage imageNamed:@"pix"] logoSize:CGSizeMake(50, 50)];
    
    _qrImgView.image = newImage;
    
    
    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
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
