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

@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    
    self.getCodeBtn.layer.cornerRadius = 5;
    self.getCodeBtn.layer.borderWidth = 0.2;
    self.getCodeBtn.layer.borderColor = [UIColor redColor].CGColor;
    
    self.registerBtn.layer.cornerRadius = 2;
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

// 注册
- (IBAction)registerAction:(id)sender {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:RegisterSuccess sender:self];
    });
}

// 定位按钮
- (IBAction)locateAction:(id)sender {
    
}

- (IBAction)getCodeAction:(id)sender {
    [self countDownTime:@60];
}

/**
 *  倒计时函数
 */
-(void)countDownTime:(NSNumber *)sourceDate{
    
//    self.getCodeBtn.backgroundColor = [UIColor lightGrayColor];
    self.getCodeBtn.enabled = NO;
    __block int timeout = sourceDate.intValue; //倒计时时间
    dispatch_queue_t dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatchQueue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0*NSEC_PER_SEC, 0);//每秒执行
    __weak typeof(self) weakSelf = self;
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 1){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //界面的设置
                [weakSelf.getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                weakSelf.getCodeBtn.enabled = YES;
//                weakSelf.getCodeBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:88/255.0 blue:34/255.0 alpha:1];

//                [MessageTool showMessage:@"验证码过期" isError:YES];
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                //界面的设置
                NSString *numStr=[NSString stringWithFormat:@"剩余%d秒",timeout];
                //                _button_sendAgain.titleLabel.text = numStr;
                [weakSelf.getCodeBtn setTitle:numStr forState:UIControlStateDisabled];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
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
